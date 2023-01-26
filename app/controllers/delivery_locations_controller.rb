class DeliveryLocationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :redirect, only: [:index, :create]

  def index
    @delivery_location = BuyForm.new
  end

  def create
      @delivery_location = BuyForm.new(delivery_location_params)
  if @delivery_location.valid?
    pay_item
    @delivery_location.save
    return redirect_to root_path
    else
    render :index
    end
  end

  private

  def delivery_location_params
  params.require(:buy_form).permit(:postal_code, :shipper_id, :municipalities, :address, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: delivery_location_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
end

  def redirect
    if (@item.user_id == current_user.id) || (@item.buy != nil)
      redirect_to root_path
    end
  end

end