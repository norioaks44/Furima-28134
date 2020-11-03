class ItemsController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @item = Item.new
  end

  def item_params
    params.require(:item).permit(:image).merge(user_id: current_user.id)
    
  end
end
