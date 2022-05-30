class ListsController < ApplicationController
  def index
    @lists = List.all
    @bookmarks = Bookmark
  end

  def show
    @lists = List.all
    @list = @lists.find(params[:id])
    @bookmarks = Bookmark.all
    @bookmarks = @bookmarks.where('list_id = ?', @list.id)
    # @movie = Movie.all.where('title LIKE ?', "potato")
  end
end
