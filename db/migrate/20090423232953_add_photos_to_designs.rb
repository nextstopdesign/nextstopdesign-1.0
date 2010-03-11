class AddPhotosToDesigns < ActiveRecord::Migration
  def self.up
    add_column :designs, :photo1_file_name, :string
    add_column :designs, :photo1_content_type, :string
    add_column :designs, :photo1_file_size, :integer
    add_column :designs, :photo1_updated_at, :datetime

    add_column :designs, :photo2_file_name, :string
    add_column :designs, :photo2_content_type, :string
    add_column :designs, :photo2_file_size, :integer
    add_column :designs, :photo2_updated_at, :datetime

    add_column :designs, :photo3_file_name, :string
    add_column :designs, :photo3_content_type, :string
    add_column :designs, :photo3_file_size, :integer
    add_column :designs, :photo3_updated_at, :datetime
  end

  def self.down
    remove_column :designs, :photo1_file_name
    remove_column :designs, :photo1_content_type
    remove_column :designs, :photo1_file_size
    remove_column :designs, :photo1_updated_at

    remove_column :designs, :photo2_file_name
    remove_column :designs, :photo2_content_type
    remove_column :designs, :photo2_file_size
    remove_column :designs, :photo2_updated_at

    remove_column :designs, :photo3_file_name
    remove_column :designs, :photo3_content_type
    remove_column :designs, :photo3_file_size
    remove_column :designs, :photo3_updated_at
  end
end
