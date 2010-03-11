class Newphotos < ActiveRecord::Migration
  def self.up
    drop_table :photos
    create_table :photos do |t|
      t.string :title
      t.text :description
      t.string :credit
      t.string :url
      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end
