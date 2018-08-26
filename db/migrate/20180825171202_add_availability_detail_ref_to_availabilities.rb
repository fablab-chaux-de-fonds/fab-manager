class AddAvailabilityDetailRefToAvailabilities < ActiveRecord::Migration
  def change
    add_reference :availabilities, :availability_detail, index: true, foreign_key: true
  end
end
