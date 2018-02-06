class AddSubCategoryToProducts < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :category_id
    add_reference :products, :sub_category, index: true
  end
end
