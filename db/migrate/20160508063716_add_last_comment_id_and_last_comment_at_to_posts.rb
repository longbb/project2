class AddLastCommentIdAndLastCommentAtToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :last_comment_id, :integer
    add_column :posts, :last_comment_at, :datetime
  end
end
