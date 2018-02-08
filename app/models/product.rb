class Product < ApplicationRecord
  mount_uploaders :product_photos, ProductPhotoUploader
  before_save :reformat_input

  belongs_to :user

  private
    def reformat_input
      self.sub_categories = sub_categories.delete_if { |e| e==="" }
    end
end
