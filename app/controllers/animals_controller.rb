class AnimalsController < ApplicationController

  def index
    @quotes = Quote.all
    json_response(@quotes)
  end
  def show
    @animal = Animal.find(params[:id])
    json_response(@animal)
  end

  def create
    @quote = Quote.create!(quote_params)
    json_response(@quote, :created)
  end

  def update
    @quote = Quote.find(params[:id])
    if @quote.update!(quote_params)
      render status: 200, json: {
       message: "This quote has been updated successfully."
       }
    end
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
