class RenameSublingsToSiblingsAndAddPhoneAndEmail < ActiveRecord::Migration[6.0]
  def change
    remove_column :applications, :has_sublings
    add_column :applications, :has_siblings, :boolean, :default => false
    add_column :applications, :email, :string
    add_column :applications, :phone, :string
  end
end
