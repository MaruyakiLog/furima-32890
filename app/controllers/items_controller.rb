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
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
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
    if user_signed_in? == false
      render "devise/sessions/new"
    end
  end

  def user_check
    item = Item.find(params[:id])
    if current_user.id != item.user.id
      @items = Item.order(id: 'DESC')
      render "index"
    end
  end

end
