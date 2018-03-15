class RemoveImageFileNameFromMovies < ActiveRecord::Migration[5.1]
  def change
    remove_column :movies, :image_file_name, :string
  end
end
