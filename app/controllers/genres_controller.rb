class GenresController < ApplicationController
  before_action :require_login

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to cookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:genre_name)
  end
end
