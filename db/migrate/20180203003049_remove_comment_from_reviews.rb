class RemoveCommentFromReviews < ActiveRecord::Migration[5.1]
  def change
    remove_column :reviews, :comment, :string
  end
end
