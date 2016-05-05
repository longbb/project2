class CreateAvatarsForRailsMember < ActiveRecord::Migration
  def up    
    add_attachment :members, :logo
  end
  
  def self.down
    remove_attachment :members, :logo
  end
end
