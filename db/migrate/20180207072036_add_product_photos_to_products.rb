class AddProductPhotosToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :product_photos, :json
  end
end
