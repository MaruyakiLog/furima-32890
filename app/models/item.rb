class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :responsibility
  belongs_to :prefecture
  belongs_to :day
  
  HANKAKU_NUM_REGEX = /\A[0-9]+$\z/.freeze
  
  with_options presence:true do
    validates :image
    validates :name
    validates :description
    validates :category_id, numericality: {other_than: 1, message: 'Select'}
    validates :condition_id, numericality: {other_than: 1, message: 'Select'}
    validates :responsibility_id, numericality: {other_than: 1, message: 'Select'}
    validates :prefecture_id, numericality: {other_than: 1, message: 'Select'}
    validates :day_id, numericality: {other_than: 1, message: 'Select'}
    validates :price, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'Out of setting range'}, format: {with: HANKAKU_NUM_REGEX, message: 'Half-width number' }
    validates :user
  end
end
