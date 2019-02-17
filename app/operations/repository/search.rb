require 'faraday'

class Repository::Search

  def initialize
    @languages = ['ruby', 'java', 'python', 'c', 'go']
    @responses = []
    @conn = nil
    @status = 'Repositórios importados com sucesso!'
  end

  def call
    build_request
    make_requests
    create_repositories
    @status
  end

  private

  def build_request
    @conn = Faraday.new(:url => 'https://api.github.com') do |builder|
      builder.response :json
      builder.adapter  :typhoeus
    end
  end

  def make_requests
    begin
      @conn.in_parallel do
        @languages.each do |language|
          @responses << @conn.get('/search/repositories', q: "language:#{language}", sort: 'stars', order: 'desc')
        end
      end
    rescue Exception => ex
      @status = "Erro ao chamar API do Github #{ex.message}"
    end
  end
  
  def create_repositories
    begin
      @responses.each do |resp|
        if (resp.status == 200)
          api_repository = resp.body["items"].first
          owner = create_owner(api_repository["owner"])
          create_repository(api_repository, owner)
        end
      end
    rescue Exception => ex
      @status = "Erro ao salvar dados no banco #{ex.message}"
    end
  end

  def create_repository(api_repository, owner)
    repository = Repository.where(external_id: api_repository['id']).first_or_initialize
    repository.owner = owner
    repository.private = api_repository['private']
    repository.size = api_repository['size']
    repository.stargazers_count = api_repository['stargazers_count']
    repository.watchers_count = api_repository['watchers_count']
    repository.forks_count = api_repository['forks_count']
    repository.open_issues_count = api_repository['open_issues_count']
    repository.name = api_repository['name']
    repository.full_name = api_repository['full_name']
    repository.html_url = api_repository['html_url']
    repository.description = api_repository['description']
    repository.url = api_repository['url']
    repository.homepage = api_repository['homepage']
    repository.language = api_repository['language']
    repository.master_branch = api_repository['master_branch']
    repository.default_branch = api_repository['default_branch']
    repository.fork = api_repository['fork']
    repository.pushed_at = api_repository['pushed_at']
    repository.created_at = api_repository['created_at']
    repository.updated_at = api_repository['updated_at']
    repository.save
  end

  def create_owner(api_owner)
    owner = Owner.where(external_id: api_owner['id']).first_or_initialize
    owner.login = api_owner['login']
    owner.avatar_url = api_owner['avatar_url']
    owner.url = api_owner['url']
    owner.owner_type = api_owner['type']
    owner.save
    owner
  end
end