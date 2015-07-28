class ReAddImageUrlColumnToMoviesTable < ActiveRecord::Migration
  def change
    add_column(:movies, :poster_image_url, :string)
  end
end
