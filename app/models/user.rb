class User < ApplicationRecord
  has_many :items
  has_many :purchases

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'

  ZENKAKU_REGEX = /\A[ぁ-んァ-ン一-龥々ー]+\z/.freeze
  ZENKAKU_KANA_REGEX = /\A[ァ-ヶー－]+\z/
  with_options presence: true do
    validates :nickname
    validates :birthday
    with_options format: { with: ZENKAKU_REGEX, message: 'には全角文字で設定してください' } do
      validates :last_name
      validates :first_name
    end
    with_options format: { with: ZENKAKU_KANA_REGEX, message: 'には全角カタカナで設定してください' } do
      validates :last_name_kana
      validates :first_name_kana
    end
  end
end
