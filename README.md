# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

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
|phone_tel|integer|null:　false, unique: true|
|birthday|integer|null: false|
|credit_card|integer|null: false|
|profile|text||
|image|string||

has_one :credit_card
has_many :items
has_many :comments
has_many :like


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


## credit_cardテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true, index: true|
|card_id|integer|null: false, unique: true|
|month|integer|null: false|
|year|integer|null: false|
|security_code|integer|null: false,unique: true|

belongs_to :user

## itemテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true, index: true|
|name|string|null: false, index:true|
|description|text|null: false|
|category|string|null: false|
|condition|string|null: false|
|shipping_fee|integer|null: false|
|shipping_method|string|null: false|
|shipping_region|string|null: false|
|shipping_day|integer|null: false|
|price|integer|null: false|
|brand|string|null: false|

belongs_to :user
has_many :comments
belongs_to :brands
belongs_to :categories
has_many :like

## categoriesテーブル
|name|string|null: false|

has_many :items
has_aucestry

## brandsテーブル
|name|string|null: false|

has_many :items

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
