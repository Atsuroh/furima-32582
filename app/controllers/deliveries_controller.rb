class DeliveriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item

  def index
    @delivery = Delivery.new
  end

  def create
    @delivery = Delivery.new(delivery_params)
    if @delivery.valid?
      pay_item
      @delivery.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def delivery_params
    params.require(:delivery).permit(:post_code,:prefecture_id, 
                                     :city, :address,
                                     :phone_number).merge(token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
  
  def pay_item
    Payjp.api_key = "sk_test_762d37d93c17a8751738426e"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: order_params[:price],  # 商品の値段
      card: delivery_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end