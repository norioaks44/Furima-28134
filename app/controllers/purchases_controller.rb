class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only:[:index, :create]
  before_action :set_user_check, only: :index

  def index
    @purchase = UserPurchase.new
    if @item.purchase != nil
      redirect_to root_path
    end
  end
  
  def create
    @purchase = UserPurchase.new(purchase_params)
    if @purchase.valid?
      pay_purchase
      @purchase.save
      redirect_to root_path
    else
      render :index
    end
  end
  
  
  private
  def purchase_params
    params.permit(:token, :postal_code, :delivery_prefecture_id, :city, :house_number, :building_name, :phone_number, :item_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end
  
  def set_item
    @item = Item.find(params[:item_id])
  end
  
  def pay_purchase
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item[:price],
      card: purchase_params[:token],
      currency: 'jpy'
      )
  end
    
  def set_user_check
    if current_user.id == @item.user_id 
      redirect_to root_path
    end
  end

end
