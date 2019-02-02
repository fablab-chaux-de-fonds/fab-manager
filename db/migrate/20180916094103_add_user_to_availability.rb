class AddUserToAvailability < ActiveRecord::Migration
  def change
    add_reference :availabilities, :user, index: true, foreign_key: true
  end
end
