class MoviesController < ApplicationController
  
  def index
    movies = Movie.all
    render json: movies
  end

  def create
    movie = Movie.create(toy_params)
    render json: movie, status: :created
  end

  def update
    movie = Movie.find_by(id: params[:id])
    movie.update(toy_params)
  end

  def destroy
    movie = Movie.find_by(id: params[:id])
    movie.destroy
    head :no_content
  end

  private
  
  def toy_params
    params.permit(:title, :year, :length, :director, description, :poster_url, :category)
  end
end
