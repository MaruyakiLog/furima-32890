class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :responsibility
  belongs_to :prefecture
  belongs_to :day
  
  HANKAKU_NUM_REGEX = /\A[0-9]+\z/.freeze
  
  with_options presence:true do
    validates :name
    validates :description
    validates :category_id, numericality: {other_than: 1}
    validates :condition_id
    validates :responsibility_id
    validates :prefecture_id
    validates :day_id
    validates :price, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}, format: {with: HANKAKU_NUM_REGEX, message: 'には半角数字で入力してください'}
    validates :user
  end
end
