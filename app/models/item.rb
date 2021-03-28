class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  HANKAKU_NUM_REGEX = /\A[0-9]+\z/.freeze

  with_options presence:true do
    validates :name
    validates :description
    validates :category_id
    validates :condition_id
    validates :responsibility_id
    validates :prefecture_id
    validates :day_id
    validates :price, greater_than_or_equel_to: 300, lass_than_or_equel_to: 9999999, format: {with: HANKAKU_NUM_REGEX, message: 'には半角数字で入力してください'}
    validates :user
  end
end
