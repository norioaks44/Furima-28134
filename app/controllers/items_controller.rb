class ItemsController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @item = Item.new
  end
end
