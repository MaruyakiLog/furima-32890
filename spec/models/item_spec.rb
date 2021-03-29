require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  context '出品ができる場合' do
    it 'image,name,description,category_id,codition_id,responsibility_id,prefecture_id,day_id,price,userが存在する' do
      expect(@item).to be_valid
    end
  end
  context '出品ができない場合' do
    # image
    it 'imageが空である' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    # name
    it 'nameが空である' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    # desctiption
    it 'desctiptionが空である' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    # category_id
    it 'category_idが1である' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category Select')
    end
    it 'category_idが0である' do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Category Out of setting range')
    end
    it 'category_idが12である' do
      @item.category_id = 12
      @item.valid?
      expect(@item.errors.full_messages).to include('Category Out of setting range')
    end

    # condition_id
    it 'condition_idが1である' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Condition Select')
    end
    it 'condition_idが0である' do
      @item.condition_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Condition Out of setting range')
    end
    it 'condition_idが8である' do
      @item.condition_id = 8
      @item.valid?
      expect(@item.errors.full_messages).to include('Condition Out of setting range')
    end

    # responsibility_id
    it 'responsibility_idが1である' do
      @item.responsibility_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Responsibility Select')
    end
    it 'responsibility_idが0である' do
      @item.responsibility_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Responsibility Out of setting range')
    end
    it 'responsibility_idが4である' do
      @item.responsibility_id = 4
      @item.valid?
      expect(@item.errors.full_messages).to include('Responsibility Out of setting range')
    end

    # prefecture_id
    it 'prefecture_idが1である' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture Select')
    end
    it 'prefecture_idが0である' do
      @item.prefecture_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture Out of setting range')
    end
    it 'prefecture_idが49である' do
      @item.prefecture_id = 49
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture Out of setting range')
    end

    # day_id
    it 'day_idが1である' do
      @item.day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Day Select')
    end
    it 'day_idが0である' do
      @item.day_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Day Out of setting range')
    end
    it 'day_idが5である' do
      @item.day_id = 5
      @item.valid?
      expect(@item.errors.full_messages).to include('Day Out of setting range')
    end

    # price
    it 'priceが空である' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it 'priceが299である' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
    end
    it 'priceが10000000(1千万)である' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
    end
    it 'priceが半角数字ではないである' do
      @item.price = '　　'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
    end

    # user
    it 'userが空である' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end
  end
end
