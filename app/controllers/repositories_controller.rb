class RepositoriesController < ApplicationController

  def search
    result = Repository::Search.new().call
    redirect_to repositories_path, notice: result
  end

  def home

  end

  def index
    @repositories = Repository.order(:name).page(params[:page])
  end

  def show
    @repository = Repository.find_by(id: params[:id])
    redirect_to repositories_path, notice: 'Nenhum repositorio encontrado com esse id' unless @repository
  end

end
