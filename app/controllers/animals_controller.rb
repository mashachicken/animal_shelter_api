class AnimalsController < ApplicationController

  def index
    name = params[:name]
    @animals = Animal.all
    json_response(@animals)
  end
  def show
    @animal = Animal.find(params[:id])
    json_response(@animal)
  end
  def random
    @animal = Animal.find(params[rand(1...50)])
    json_response(@animal)
  end

  def create
    @quote = Animal.create!(animal_params)
    json_response(@quote, :created)
  end

  def update
    @quote = Animal.find(params[:id])
    if @quote.update!(animal_params)
      render status: 200, json: {
        message: "This quote has been updated successfully."
      }
    end
  end

  def destroy
    @animal = Animal.find(params[:id])
    @animal.destroy
  end
  def animal_params
    params.permit(:name, :breed)
  end
  private
  def json_response(object, status = :ok)
    render json: object, status: status
  end
end
