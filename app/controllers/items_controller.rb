require 'responsibility'
class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :user_check, only: [:edit, :update, :destroy]
  before_action :sold_out_check, only: :edit

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
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :responsibility_id, :prefecture_id,
                                 :day_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def user_check
    if current_user.id != @item.user.id
      @items = Item.order(id: 'DESC')
      render 'index'
    end
  end

  def sold_out_check
    if @item.purchase != nil
      if user_signed_in? 
        @items = Item.order(id: 'DESC')
        render 'index'
      else
        render 'devise/sessions/new'
      end
    end
  end
end
