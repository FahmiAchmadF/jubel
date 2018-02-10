class RemoveSubCategoryFromProducts < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :sub_category_id
  end
end
