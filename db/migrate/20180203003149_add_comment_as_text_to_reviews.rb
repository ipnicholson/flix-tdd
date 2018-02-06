class AddCommentAsTextToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :comment, :text
  end
end
