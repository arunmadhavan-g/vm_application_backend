class CreateAlumnis < ActiveRecord::Migration[6.0]
  def change
    create_table :alumnis do |t|
      t.string :relationship
      t.integer :year_of_passing
      t.string :reg_no

      t.timestamps
    end
  end
end
