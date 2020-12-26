class DeliveriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  
  def index
    @delivery = Delivery.new
  end

  def create
    @delivery = Delivery.new(delivery_params)
    if @deliver.valid?
      @delivery.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def delivery_params
    params.require(:delivery).permit(:price)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end  
end