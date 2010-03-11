class AddRatingTable < ActiveRecord::Migration
  def self.up
    create_table :ratings do |t|
      t.integer :rating, :default => 0
      t.string :rateable_type, :limit => 15, :default => "", :null => false
      t.integer :rateable_id, :default => 0, :null => false
      t.integer :user_id, :default => 0, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end
