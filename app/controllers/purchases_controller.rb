class PurchasesController < ApplicationController

  def index
    @purchase = Purchase.new
    @item = Item.find(params[:item_id])
  end

end
