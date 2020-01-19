class AssociateAlumniWithApplication < ActiveRecord::Migration[6.0]
  def change
    add_reference :applications, :alumni
  end
end
