class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_celler_match, only: [:edit, :destroy]
  before_action :after_purchase_block, only: [:edit, :update, :destroy]
  
  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :name, :image, :text, :category_id, :condition_id, :delivery_charge_id, :delivery_prefecture_id, :delivery_day_id, :price
    ).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_celler_match
    if current_user.id != @item.user_id
      render :show
    end
  end
  
  def after_purchase_block
    if @item.purchase != nil
      redirect_to root_path
    end
  end

end
