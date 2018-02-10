class AddSubCategoriesToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :sub_categories, :text, array: true
  end
end
