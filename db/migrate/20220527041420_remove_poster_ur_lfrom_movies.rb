class RemovePosterUrLfromMovies < ActiveRecord::Migration[6.1]
  def change
    remove_column :movies, :post_url
    add_column :movies, :poster_url, :text
  end
end
