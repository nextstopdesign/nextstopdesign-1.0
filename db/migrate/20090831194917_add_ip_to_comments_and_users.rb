class AddIpToCommentsAndUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :ip_address, :string
    add_column :comments, :ip_address, :string
    add_column :designs, :ip_address, :string
    add_column :ideas, :ip_address, :string
  end

  def self.down
    remove_column :users, :ip_address
    remove_column :comments, :ip_address
    remove_column :designs, :ip_address
    remove_column :ideas, :ip_address
  end
end