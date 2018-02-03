class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.integer :stock
      t.money :price
      t.text :description
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
