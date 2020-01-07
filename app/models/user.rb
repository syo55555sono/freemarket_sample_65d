class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  VALID_KANA_NAME_REGEX = /\A[ァ-ヶー－]+\z/
  
  
#登録
  validates :nickname, presence: true, length: { maximum: 20 }
  validates :family_name, presence: true, length: { maximum: 35}
  validates :first_name, presence: true, length:{ maximum: 35 }
  validates :family_name_kana, presence: true, format: {with: VALID_KANA_NAME_REGEX, message: "姓カナはカナ文字で入力してください"}
  validates :first_name_kana, presence: true, format: {with: VALID_KANA_NAME_REGEX, message: "名カナはカナ文字で入力してください"}
  validates :birth_yyyy, presence: true
  validates :birth_mm, presence: true
  validates :birth_dd, presence: true
  
  VALID_PHONE_NUMBER_REGEX = /\A\d{11}\z/
  VALID_AUTHENTICATION_NUMBER_REGEX = /\A\d{3}\z/
  
#SMS認証
  # validates :phone_tel, presence: true, uniqueness: true, format: {with: VALID_PHONE_NUMBER_REGEX, message: "電話番号の入力が正しくありません"}
  validates :authentication_number, presence: true, format: {with: VALID_AUTHENTICATION_NUMBER_REGEX, message: "認証番号が正しくありません"}
  
  # VALID_POSTAL_CODE_REGEX = /\A\d{3}[-]\d{4}\z/
  
#住所登録
  validates :family_name, presence: true, length: { maximum: 35 }
  validates :first_name, presence: true, length:{ maximum: 35 }
  validates :family_name_kana, presence: true, format: {with: VALID_KANA_NAME_REGEX, message: "姓カナはカナ文字で入力してください"}
  validates :first_name_kana, presence: true, format: {with: VALID_KANA_NAME_REGEX, message: "名カナはカナ文字で入力してください"}
  # validates :postal_code, presence: true, format: {with: VALID_POSTAL_CODE_REGEX, message: "郵便番号が正しくありません"}
  validates :prefecture, presence: true, length: { maximum: 35 }
  validates :city, presence: true, length: { maximum: 35 }
  validates :block, presence: true
  
  #   VALID_CREDIT_CARD_REGEX = /\A(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14}|6011[0-9]{12}|3(?:0[0-5]|[68][0-9])[0-9]{11}|3[47][0-9]{13})\z/
# #クレジットカード登録
  #   validates :credit_card_id ,presence: true, uniqueness: true, format: {with: VALID_CREDIT_CARD_REGEX, "クレジットカード番号の入力が正しくありません"}
  has_many :cards
        
end
