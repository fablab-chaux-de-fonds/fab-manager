class CreateAvailabilityDetails < ActiveRecord::Migration
  def change
    create_table :availability_details do |t|
      t.string :title
      t.text :description
      t.integer :textColor
      t.integer :backgroundColor
      t.integer :lockedBackgroundColor

      t.timestamps null: false
    end
  end
end
