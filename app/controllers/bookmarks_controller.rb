class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
  end

  def new
    @bookmark = Bookmark.new
    @bookmark.list = @list
    @movies = Movie.all
    @list = List.all
  end

  def show
    @bookmarks = Bookmark.all
    @bookmark = @bookmarks.find(params[:id])
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.save

    redirect_to bookmarks_path
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id , :list_id)
  end
end
