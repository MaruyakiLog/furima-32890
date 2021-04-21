class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :postal_number, :prefecture_id, :city, :address, :building, :phone_number, :token, :user_id, :item_id

  HYPHEN_REGEX = /\A\d{3}-\d{4}\z/.freeze
  NUMBER_REGEX = /\A[0-9]+\z/.freeze
  with_options presence: true do
    validates :postal_number, format: { with: HYPHEN_REGEX, message: 'Input correctly' }
    validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }
    validates :city
    validates :address
    validates :phone_number, format: { with: NUMBER_REGEX, message: 'Input only number' }, length: { maximum: 11, message: 'Out of setting range'}
    validates :token
    validates :item_id
    validates :user_id
  end
  
  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Shipping.create(postal_number: postal_number, prefecture_id: prefecture_id, city: city, address: address,
                    building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end
