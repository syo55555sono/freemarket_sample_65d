class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d!@#\$%\^\&*\)\(+=._-]{7,128}\z/i
  VALID_KANA_NAME_REGEX = /\A[ァ-ヶー－]+\z/


#登録
  validates :nickname, presence: true, length: { maximum: 20 } 
  validates :email, presence: true, uniquness: true, format: {with: VALID_EMAIL_REGEX, message: "のフォーマットが不適切です"}
  validates :password, presence: true, length: {in: 7..128}, format: {with: VALID_PASSWORD_REGEX, message: "は英字と数字両方を含むパスワードを設定してください"}
  validates :family_name, presence: true, length: {maximum: 35}
  validates :first_name, presence: true, length:{maximum:35}
  validates :family_name_kana, presence: true, format: {with: VALID_KANA_NAME_REGEX, message: "姓カナはカナ文字で入力してください"}
  validates :first_name_kana, presence: true, format: {with: VALID_KANA_NAME_REGEX, message: "名カナはカナ文字で入力してください"}
  validates :birthday_id, presence: true

  VALID_PHONE_NUMBER_REGEX = /\A\d{11}\z/
  VALID_AUTHENTICATION_NUMBER_REGEX = /\A\d{3}\z/
  
  

#SMS認証
  validates :phone_tel, presence: true, unique: true, format: {with: ALID_PHONE_NUMBER_REGEX, message: "電話番号の入力が正しくありません"}
  validates :authentication_number, presence: true, format: {with: VALID_AUTHENTICATION_NUMBER_REGEX, message: "認証番号が正しくありません"}
  
  VALID_POSTAL_CODE_REGEX = /\A\d{3}[-]\d{4}\z/

#住所登録
  validates :family_name, presence: true, length: {maximum: 35}
  validates :first_name, presence: true, length:{maximum:35}
  validates :family_name_kana, presence: true, format: {with: VALID_KANA_NAME_REGEX, message: "姓カナはカナ文字で入力してください"}
  validates :first_name_kana, presence: true, format: {with: VALID_KANA_NAME_REGEX, message: "名カナはカナ文字で入力してください"}
  validates :postal_code, presence: true, length: { maximum: 35 }
  validates :prefecture, presence: true, length: { maximum: 35 }
  validates :city, presence: true, format: {with: VALID_POSTAL_CODE_REGEX, message: "郵便番号が正しくありません"}
  validates :block, presence: true

#   VALID_CREDIT_CARD_REGEX = /\A(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14}|6011[0-9]{12}|3(?:0[0-5]|[68][0-9])[0-9]{11}|3[47][0-9]{13})\z/

# #クレジットカード登録
#   validates :credit_card_id ,presence: true, unique: true, format: {with: VALID_CREDIT_CARD_REGEX, "クレジットカード番号の入力が正しくありません"}



end
