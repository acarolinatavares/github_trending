class RepositoriesController < ApplicationController

  def search
    result = Repository::Search.new().call
    redirect_to repositories_path, notice: result
  end

  def index
    @repositories = Repository.all
  end

end
