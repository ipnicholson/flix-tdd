class AddAttachmentPosterImageToMovies < ActiveRecord::Migration[5.1]
  def self.up
    change_table :movies do |t|
      t.attachment :poster_image
    end
  end

  def self.down
    remove_attachment :movies, :poster_image
  end
end
