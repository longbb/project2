class AddNumberViewsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :number_views, :integer
  end
end
