class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name
      t.string :icon
      t.boolean :published
      t.integer :sort
      t.belongs_to :page_content, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
