class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.datetime :ordered_at
      t.boolean :status

      t.timestamps
    end
  end
end
