class AddCommentatorIdToNotifications < ActiveRecord::Migration
  def change
    add_column :notifications, :commentator_id, :string
  end
end
