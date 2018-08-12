class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name, limit: 30
      t.string :title
      t.string :icon, limit: 30
      t.integer :version
      t.integer :sort
      t.boolean :published

      t.timestamps null: false
    end
    add_index :pages, :name, unique: true
  end
end
