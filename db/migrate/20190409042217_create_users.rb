class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :role, default: 2
      t.string :phone

      t.timestamps
    end
  end
end
