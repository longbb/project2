class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.references :post, index: true, foreign_key: true
      t.string :content
      t.string :status

      t.timestamps null: false
    end
  end
end
