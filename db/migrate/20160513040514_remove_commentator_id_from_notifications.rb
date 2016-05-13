class RemoveCommentatorIdFromNotifications < ActiveRecord::Migration
  def change
    remove_column :notifications, :commentator_id, :string
  end
end
