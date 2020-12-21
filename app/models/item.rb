class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :user

  validates :product_name, :text, :price, presence: true
  validates :category_id, numericality: { other_than: 1 }
end