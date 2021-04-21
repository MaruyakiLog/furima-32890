require 'rails_helper'

RSpec.describe PurchaseShipping, type: :model do
  before do
    @purchase_shipping = FactoryBot.build(:purchase_shipping)
    @user = FactoryBot.build(:user)
    @item = FactoryBot.build(:item)
  end
  context '商品を購入できる場合' do
    it 'postal_number、prefecture_id、city、address、building、phone_number、クレジットカードのtokenが存在する' do
      @user.save
      @item.save
      @purchase_shipping.user_id = @user.id
      @purchase_shipping.item_id = @item.id
      expect(@purchase_shipping).to be_valid
    end
  end
  context '商品を購入できない場合' do
    # postal_number
    it 'postal_numberが空である' do
      @purchase_shipping.postal_number = nil
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Postal number can't be blank")
    end
    it 'postal_numberの4文字目にハイフンが含まれない' do
      @purchase_shipping.postal_number = '111111-1'
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include('Postal number Input correctly')
    end
    it 'postal_numberに文字列が含まれる' do
      @purchase_shipping.postal_number = '111-11aa'
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include('Postal number Input correctly')
    end
    # prefecture_id
    it 'prefecture_idが空である' do
      @purchase_shipping.prefecture_id = nil
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'prefecture_idが1である' do
      @purchase_shipping.prefecture_id = 1
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include('Prefecture Select')
    end
    # city
    it 'cityが空である' do
      @purchase_shipping.city = nil
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("City can't be blank")
    end
    # address
    it 'addressが空である' do
      @purchase_shipping.address = nil
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Address can't be blank")
    end
    # phone_number
    it 'phone_numberが空である' do
      @purchase_shipping.phone_number = nil
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberに文字列が含まれる' do
      @purchase_shipping.phone_number = 'a1234567890'
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include('Phone number Input only number')
    end
    it 'phone_numberが12桁以上である' do
      @purchase_shipping.phone_number = '090123456789'
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Phone number Out of setting range")
    end
    # token
    it 'tokenが空である' do
      @purchase_shipping.token = nil
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Token can't be blank")
    end
    # user_id
    it 'user_idが空である' do
      @purchase_shipping.user_id = nil
      @purchase_shipping.valid?
      # binding.pry
      expect(@purchase_shipping.errors.full_messages).to include("User can't be blank")
    end
    # item_id
    it 'item_idが空である' do
      @purchase_shipping.item_id = nil
      @purchase_shipping.valid?
      # binding.pry
      expect(@purchase_shipping.errors.full_messages).to include("Item can't be blank")
    end
  end
end
