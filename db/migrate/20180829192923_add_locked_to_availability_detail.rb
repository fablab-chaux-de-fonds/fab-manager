class AddLockedToAvailabilityDetail < ActiveRecord::Migration
  def change
    add_column :availability_details, :locked, :boolean
  end
end
