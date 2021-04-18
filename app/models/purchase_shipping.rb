class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :postal_number, :prefecture_id, :city, :address, :building, :phone_number, :token
  # attr_accessor :number, :exp_month, :exp_year, :cvc, :postal_number, :prefecture, :city, :address, :phone_number
  # validates :price, presence: true
  HYPHEN_REGEX = /\A\d{3}[-]\d{4}\z/.freeze
  with_options presence: true do
    validates :postal_number, format: {with: HYPHEN_REGEX, message: 'Input correctly'}
    validates :prefecture_id, numericality: {other_than: 1, message: 'Select'}
    validates :city
    validates :address
    validates :phone_number, numericality: {less_than_or_equal_to: 11, message: 'Input only number'}
  end

  def save(item)
    purchase = Purchase.create(user_id: item.user_id, item_id: item.id)
    Shipping.create(postal_number: postal_number, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end

end