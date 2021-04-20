class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_item, only: [:index, :create]
  before_action :user_check, only: :index
  before_action :sold_out_check, only: :index

  def index
    binding.pry
    @purchase_shipping = PurchaseShipping.new
  end

  def create
    @purchase_shipping = PurchaseShipping.new(purchase_params)
    if @purchase_shipping.valid?
      pay_item(@item)
      @purchase_shipping.save(@item)
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchase_params
    params.require(:purchase_shipping).permit(:postal_number, :prefecture_id, :city, :address, :building,
                                              :phone_number).merge(token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def user_check
    redirect_to root_path if current_user.id == @item.user_id
  end

  def sold_out_check
    unless @item.purchase.nil?
      @items = Item.order(id: 'DESC')
      render '/items/index'
    end
  end

  def pay_item(item)
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
