class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
  end

  def new
    @item = Item.new
  end
  
  def create
    Item.create(item_params)
    @item.save
  end

  private
  def item_params
    params.require(:item).permit(
      :name, :text, :category_id, :condition_id, :delivery_charge_id, :delivery_prefecture_id, :delivery_day_id, :price
    ).merge(user_id: current_user.id)
  end


  # def move_to_index
  #   unless user_signed_in?
  #     redirect_to action: :index
  #   end
  # end

end
