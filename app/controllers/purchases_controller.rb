class PurchasesController < ApplicationController
before_action :set_item, only:[:index, :create]

  def index
    # @user_purchase = UserPurchase.new
    @purchase = UserPurchase.new
  end
  
  def create
    # @user_purchase = UserPurchase.new(purchase_params)
    @purchase = UserPurchase.new(purchase_params)
    # binding.pry
    if @purchase.valid?
      @purchase.save
      redirect_to root_path
    else
      render :index
    end
  end
  
  private
  def purchase_params
    params.permit(#:token, 
    :postal_code, :delivery_prefecture_id, :city, :house_number, :building_name, :phone_number, :item_id).merge(user_id: current_user.id)
  end
  
  def set_item
    @item = Item.find(params[:item_id])
  end
end
