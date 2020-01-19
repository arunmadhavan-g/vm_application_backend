class CreateControls < ActiveRecord::Migration[6.0]
  def change
    create_table :controls do |t|
      t.boolean :started

      t.timestamps
    end

    Control.create({started: false})
  end
end
