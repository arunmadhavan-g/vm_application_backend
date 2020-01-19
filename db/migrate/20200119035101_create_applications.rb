class CreateApplications < ActiveRecord::Migration[6.0]
  def change
    create_table :applications do |t|
      t.string :name
      t.string :name_father
      t.string :name_mother
      t.string :sex
      t.date :dob
      t.string :address
      t.boolean :is_alumni, :default => false
      t.boolean :has_sublings, :default => false

      t.timestamps
    end
  end
end
