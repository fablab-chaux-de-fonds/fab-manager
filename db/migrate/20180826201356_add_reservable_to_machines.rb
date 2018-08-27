class AddReservableToMachines < ActiveRecord::Migration
  def change
    add_column :machines, :reservable, :boolean
  end
end
