class AddVerificationToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :verified, :integer, :default => 0
    add_column :users, :verification_code, :string
  end

  def self.down
    remove_column :users, :verification_code
    remove_column :users, :verified
  end
end
