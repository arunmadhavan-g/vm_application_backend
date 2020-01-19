class AddsReferenceToApplicationFormInAlumniAndSiblings < ActiveRecord::Migration[6.0]
  def change
    add_reference :alumnis, :application
    add_reference :siblings, :application
  end
end
