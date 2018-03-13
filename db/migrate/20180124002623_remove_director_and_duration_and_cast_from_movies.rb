class RemoveDirectorAndDurationAndCastFromMovies < ActiveRecord::Migration[5.1]
  def change
    # remove_column :movies, :director, :string
    # remove_column :movies, :duration, :string
    remove_column :movies, :cast, :string
  end
end
