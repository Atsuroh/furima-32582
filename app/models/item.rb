class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :burden
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping

  belongs_to :user
  has_many :comments
  has_many :likes
  has_one :purchase
  has_one_attached :image

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  with_options presence: true do
    validates :image
    validates :product_name
    validates :text
    validates :price
  end
  
  validates :price, numericality: {
    greater_than_or_equal_to: 300,
    less_than_or_equal_to: 9_999_999
  }  
  validates :price, numericality: {
    with: /\A[0-9]+\z/, message: "Half-width number"
  }
  validates :category_id, :status_id, :burden_id, :prefecture_id, :shipping_id, numericality: { other_than: 1 }
end