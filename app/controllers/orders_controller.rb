class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_item, only: :index
  before_action :user_check, only: :index

  def index
    # binding.pry
  end

  def create
    redirect_to root_path
  end

  private

  def set_item
    # binding.pry
    @item = Item.find(params[:item_id])
  end

  def user_check
    # binding.pry
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end
end
