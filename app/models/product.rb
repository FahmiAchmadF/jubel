class Product < ApplicationRecord
  include PgSearch
  pg_search_scope :search_products,
                  against: { name: 'A', sub_categories: 'B' },
                  using: {
                    tsearch: { any_word: true }
                  }
  mount_uploaders :product_photos, ProductPhotoUploader
  before_save :reformat_input

  belongs_to :user

  private
    def reformat_input
      self.sub_categories = sub_categories.delete_if { |e| e==="" }
    end
end
