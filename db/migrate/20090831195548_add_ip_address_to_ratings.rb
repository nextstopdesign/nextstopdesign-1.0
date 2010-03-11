class AddIpAddressToRatings < ActiveRecord::Migration
  def self.up
    add_column :ratings, :ip_address, :string
  end

  def self.down
    remove_column :ratings, :ip_address
  end
end
