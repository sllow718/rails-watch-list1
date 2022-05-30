class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movies = Movie.all
    @movie = @movies.find(params[:id])
    @bookmark = Bookmark.find(@movie.id)
  end
end
