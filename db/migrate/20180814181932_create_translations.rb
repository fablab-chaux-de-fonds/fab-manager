class CreateTranslations < ActiveRecord::Migration
  def change
    create_table :translations do |t|
      t.string :locale, default: 'en', null: false
      t.string :key, null: false, index: true
      t.text :value, null: false
      t.text :interpolations
      t.boolean :is_proc, default: false, null: false

      t.timestamps null: false
    end
  end
end

