require 'responsibility'
class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :signout_check, only: :edit
  before_action :user_check, only: :edit

  def index
    @items = Item.order(id: 'DESC')
  end

  def new
    @item = Item.new
  end

  def create
    set_item
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    set_item
  end

  def edit
    set_item
  end

  def update
    set_item
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :responsibility_id, :prefecture_id,
                                 :day_id, :price).merge(user_id: current_user.id)
  end

  def signout_check
    render 'devise/sessions/new' if user_signed_in? == false
  end

  def user_check
    item = Item.find(params[:id])
    if current_user.id != item.user.id
      @items = Item.order(id: 'DESC')
      render 'index'
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
