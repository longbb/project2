class AddCommentatorIdToNotifications < ActiveRecord::Migration
  def change
    add_column :notifications, :commentator_id, :integer
  end
end
