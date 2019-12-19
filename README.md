## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false, unique: true|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kane|string|null: false|
|first_name_kane|string|null: false|
|phone_tel|integer|null:  false, unique: true|
|birthday|integer|null: false|
|credit_card_id|references|null: false, foreign_key: true, index: true|
|profile|text||
|image|string||

has_one :address
has_one :credit_card
has_many :items, dependent: :destroy
has_many :comments, dependent: :destroy
has_many :likes, dependent: :destroy


## addressテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false,foreign_key: true, index: true|
|postal_code|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|block|string|null: false|
|building|string||
|building_tel|integer||

belongs_to :user


## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true, index: true|
|card_id|integer|null: false, unique: true|
|month|integer|null: false|
|year|integer|null: false|
|security_code|integer|null: false,unique: true|

belongs_to :user

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true, index: true|
|image_id|references|null: false, foreign_key: true, index: true|
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
|image|string|null: false|

belongs_to :item

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
