class CreatePageContents < ActiveRecord::Migration
  def change
    create_table :page_contents do |t|
      t.integer :version
      t.text :comment

      t.timestamps null: false
    end
  end
end
