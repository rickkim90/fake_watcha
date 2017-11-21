class AddPhotoUrlToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :photo_url, :string
  end
end
