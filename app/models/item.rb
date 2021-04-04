class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :responsibility
  belongs_to :prefecture
  belongs_to :day

  HALF_NUM_REGEX = /\A[0-9]+\z/.freeze
  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id, numericality: { other_than: 1, message: 'Select' }
    validates :condition_id, numericality: { other_than: 1, message: 'Select' }
    validates :responsibility_id, numericality: { other_than: 1, message: 'Select' }
    validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }
    validates :day_id, numericality: { other_than: 1, message: 'Select' }
    validates :price, numericality: { with: HALF_NUM_REGEX, message: 'Half-width number' }
    validates :user
  end
  validates :category_id,
            numericality: { greater_than_or_equal_to: 2, less_than_or_equal_to: 11, message: 'Out of setting range' }
  validates :condition_id,
            numericality: { greater_than_or_equal_to: 2, less_than_or_equal_to: 7, message: 'Out of setting range' }
  validates :responsibility_id,
            numericality: { greater_than_or_equal_to: 2, less_than_or_equal_to: 3, message: 'Out of setting range' }
  validates :prefecture_id,
            numericality: { greater_than_or_equal_to: 2, less_than_or_equal_to: 48, message: 'Out of setting range' }
  validates :day_id, numericality: { greater_than_or_equal_to: 2, less_than_or_equal_to: 4, message: 'Out of setting range' }
  validates :price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
end
