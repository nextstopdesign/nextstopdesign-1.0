class CreateDesigns < ActiveRecord::Migration
  def self.up
    create_table :designs do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :designs
  end
end
