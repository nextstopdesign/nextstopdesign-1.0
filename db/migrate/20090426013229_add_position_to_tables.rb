class AddPositionToTables < ActiveRecord::Migration
  def self.up
    add_column :designs, :position, :integer
    add_column :photos, :position, :integer
    add_column :ideas, :position, :integer
  end

  def self.down
    remove_column :designs, :position
    remove_column :photos, :position
    remove_column :ideas, :position
  end
end
