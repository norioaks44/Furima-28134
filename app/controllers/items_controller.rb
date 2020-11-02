class ItemsController < ApplicationController
  def index
    @users = User.all
  end
end
