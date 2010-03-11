class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :zip_code
      t.string :email
      t.string :username
      t.string :password
      t.string :race
      t.string :other_race
      t.string :public_transportation_use_frequency
      t.string :public_transporation_use_when
      t.string :public_transportation_use_why
      t.string :urban_planning_meeting_attendance
      t.string :urban_planning_coorespondance
      t.string :reference
      t.string :other_reference
      t.integer :accepted_tou
      t.integer :contact_ok
      t.datetime :birthdate

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
