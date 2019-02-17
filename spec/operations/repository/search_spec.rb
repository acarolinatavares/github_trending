require 'rails_helper'

describe Repository::Search do

  describe "call" do
    it "must save repositories on database" do
      VCR.use_cassette('repositories') do
        operation_status = Repository::Search.new().call
        repository = Repository.find_by(language: 'Go')
        expect(operation_status).to eq('Repositorios importados com sucesso!')
        expect(repository.description).to eq("The Go programming language")
      end
    end
  end

end