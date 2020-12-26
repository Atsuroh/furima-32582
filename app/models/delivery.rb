class Delivery < ApplicationRecord
  has_one :purchase
  attr_accessor :token
  
  with_options presence: true do
    validates :token
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'を正しく入力してください' }
    validates :prefecture_id, numericality: {other_than: 1}
    validates :city
    validates :address
    validates :phone_number, numericality: {only_integer: true}, length: {maximum: 11}
    validates :user_id
    validates :item_id
  end 
end