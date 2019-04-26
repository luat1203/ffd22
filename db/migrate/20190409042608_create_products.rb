class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.text :information
      t.text :image
      t.boolean :classify
      t.integer :quantity
      t.references :category, foreign_key: true

      t.timestamps
    end
    add_index :products, [:category_id, :created_at]
  end
end
