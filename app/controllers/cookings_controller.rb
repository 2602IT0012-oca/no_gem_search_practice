class CookingsController < ApplicationController
  before_action :require_login

  def index
    @cookings = Cooking.search(params[:dish_name], params[:genre_id])
  end

  def new
    @cooking = Cooking.new
  end

  def create
    @cooking = Cooking.new(cooking_params)
    if @cooking.save
      redirect_to cooking_path(@cooking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @cooking = Cooking.find(params[:id])
  end

  private

  def cooking_params
    params.require(:cooking).permit(:title, :content, :genre_id)
  end
end
