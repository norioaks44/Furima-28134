class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.valid?
      redirect_to root_path
    else
      render :new
    end

  end

  private
  def item_params
    params.require(:item).permit(
      :name, :image, :text, :category_id, :condition_id, :delivery_charge_id, :delivery_prefecture_id, :delivery_day_id, :price
    ).merge(user_id: current_user.id)

  end

end
