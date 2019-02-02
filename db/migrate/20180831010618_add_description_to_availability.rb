class AddDescriptionToAvailability < ActiveRecord::Migration
  def change
    add_column :availabilities, :description, :string
  end
end
