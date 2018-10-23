class AddLockedToAvailabilityDetail < ActiveRecord::Migration
  def change
    add_column :availability_details, :locked, :boolean, null: false, default: false
  end
end
