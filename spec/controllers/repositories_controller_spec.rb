require 'rails_helper'

describe RepositoriesController do

  before(:all) do
    owner = Owner.create(login: 'rails', avatar_url: 'https://avatars1.githubusercontent.com/u/4223?v=4',
                         url: 'https://api.github.com/users/rails', owner_type: 'Organization')

    @repository = Repository.create(owner: owner, private: false, size: 179102,stargazers_count: 42189,
                                   watchers_count: 42189, name: 'rails', full_name: "rails/rails",
                                   html_url: "https://github.com/rails/rails", description: "Ruby on Rails",
                                   url: "https://api.github.com/repos/rails/rails",
                                   homepage: "https://rubyonrails.org", language: "Ruby")
  end

  describe "GET index" do
    it "assigns @repositories" do
      get :index
      expect(assigns(:repositories)).to eq([@repository])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET show" do
    it "assigns @repository" do
      get :show, params: {id: @repository.id}
      expect(assigns(:repository)).to eq(@repository)
    end

    it "renders the show template" do
      get :show, params: {id: @repository.id}
      expect(response).to render_template("show")
    end

    it "redirect to index template when pass a inexistent id" do
      get :show, params: {id: 1000}
      expect(response).to redirect_to(repositories_path)
      expect(flash[:notice]).to eq('Nenhum repositorio encontrado com esse id')
    end
  end

  describe "GET search" do
    it "redirect to index template after search repositories" do
      VCR.use_cassette('repositories') do
        get :search
        expect(response).to redirect_to(repositories_path)
      end
    end
  end
end