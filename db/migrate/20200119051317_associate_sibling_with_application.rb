class AssociateSiblingWithApplication < ActiveRecord::Migration[6.0]
  def change
    add_reference :applications, :siblings
  end
end
