class Order
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :post_code, :prefecture_id, :city, :address, :building, :phone_number
  
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

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Delivery.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end
