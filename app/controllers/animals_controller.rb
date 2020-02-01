class AnimalsController < ApplicationController

  def index
    @animals = {"animal": "cat."}
    json_response(@animals)
  end
  def show
    @animal = Animal.find(params[:id])
    json_response(@animal)
  end

  def create
    @animal = Animal.create(quote_params)
    json_response(@animal)
  end

  def update
    @animal = Animal.find(params[:id])
    @animal.update(quote_params)
  end

  def destroy
    @animal = Animal.find(params[:id])
    @animal.destroy
  end
  private
  def json_response(object, status = :ok)
    render json: object, status: status
  end
end
