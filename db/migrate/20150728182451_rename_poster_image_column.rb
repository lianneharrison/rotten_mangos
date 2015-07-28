class RenamePosterImageColumn < ActiveRecord::Migration
  def change
    rename_column(:movies, :poster_image, :image)
  end
end
