class AddDeletedAtToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :deleted_at, :datetime
  end
end
