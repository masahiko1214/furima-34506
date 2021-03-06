class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,             null: false
      t.text :explanation,        null: false
      t.references :user,         null: false, foreign_key: true
      t.integer :category_id,     null: false
      t.integer :condition_id,    null: false
      t.integer :burden_id,       null: false
      t.integer :prefecture_id,   null: false
      t.integer :days_to_ship_id, null: false
      t.integer :price,           null: false
      t.timestamps
    end
  end
end
