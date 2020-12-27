class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_purchase, only: [:index, :create]

  def index
    @order = Order.new
    if @item.user_id == current_user.id || @item.purchase.present?
      redirect_to root_path
    end
  end

  def create
    @order = Order.new(purchase_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:order).permit(:post_code,:prefecture_id, 
                                  :city, :address,:phone_number)
                                  .merge(user_id: current_user.id, 
                                  item_id: params[:item_id], token: params[:token])
  end

  def set_purchase
    @item = Item.find(params[:item_id])
  end
  
  def pay_item
    Payjp.api_key = ""  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end