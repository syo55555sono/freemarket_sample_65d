## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false, unique: true|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|phone_tel|integer|null:  false, unique: true|
|authentication_number|integer|null: false|
|postal_code|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|block|string|null: false|
|building|string||
|building_tel|integer||
|profile|text||


has_one :credit_card
has_one :image
has_many :items, dependent: :destroy
has_many :comments, dependent: :destroy
has_many :likes, dependent: :destroy

## birthdaysテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true, index: true|


## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true, index: true|
|month|integer|null: false|
|year|integer|null: false|
|security_code|integer|null: false,unique: true|

belongs_to :user

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true, index: true|
|name|string|null: false, index:true|
|description|text|null: false|
|category_id|references|null: false, foreign_key: true, index: true|
|condition|string|null: false|
|shipping_fee|integer|null: false|
|shipping_method|string|null: false|
|shipping_region|string|null: false|
|shipping_day|integer|null: false|
|price|integer|null: false|
|brand|string|null: false|

belongs_to :user
has_many :images, dependent: :destroy
has_many :comments, dependent: :destroy
belongs_to :brand
belongs_to :category
has_many :likes, dependent: :destroy

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true, index: true|
|user_id|references|null: false, foreign_key: true, index: true|
|image|string|null: false|

belongs_to :item
belongs_to :user

## categoriesテーブル
|name|string|null: false|

has_many :items, dependent: :destroy

## brandsテーブル
|name|string|null: false|

has_many :items, dependent: :destroy

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true, index: true|
|item_id|references|null: false, foreign_key: true, index: true|
|body|text|null: false|

belongs_to :user
belongs_to :item

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true, index: true|
|item_id|references|null: false, foreign_key: true, index: true|

belongs_to :user
belongs_to :item
