class CreateSiblings < ActiveRecord::Migration[6.0]
  def change
    create_table :siblings do |t|
      t.string :relationship
      t.integer :year_of_admission
      t.string :reg_no

      t.timestamps
    end
  end
end
