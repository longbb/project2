class AddNotificationToMember < ActiveRecord::Migration
  def change
    add_column :members, :notification, :string
  end
end
