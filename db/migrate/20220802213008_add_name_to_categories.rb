class AddNameToCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :name, :string, null: false
  end
end
