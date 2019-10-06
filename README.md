# README

# DB設計
## usersテーブル
|column|type|options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|
|profile_image|string|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|
|phone_number|integer|null: false|
- has_one :card
- has_many :valuations
- has_many :users, through: :valuations
- has_many :messages
- has_many :users, through: :messages
- has_many :products
- has_many :points
- has_many :likes
- has_many :products, through: :products
- has_many :confirmpurchases
- has_many :products, through: :confirmpurchases
- has_one :address

## address テーブル
|column|type|options|
|------|----|-------|
|postalcode|integer|null: false|
|prefectures|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building_name|string||
- belongs_to :user

## cardsテーブル
|user_id|integer|null: false, foreign_key: true|
|card_number|integer|null: false|
|expiration_date|integer|null: false|
|security_code|integer|null: false|
- belongs_to user

## productsテーブル
|column|type|options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|image|string|null: false|
|detail|text|null: false|
|condition|integer|null: false, foreign_key: true|
|shipping_fee|integer|null: false, foreign_key: true|
|shipping_method_id|integer|null: false, foreign_key: true|
|prefectures_id|integer|null: false, foreign_key: true|
|deliveryday_id|integer|null: false, foreign_key: true|
|exhibitor_user_id|integer|null: false, foreign_key: true|
|category_first_id|integer|null: false, foreign_key: true|
|category_second_id|integer|null: false, foreign_key: true|
|category_third_id|integer|null: false, foreign_key: true|
|brand_id|integer||
|size_id|integer|null: false, foreign_key: true|
- belongs_to :user
- has_many :users, through: :confirmpurchases
- has_many :confirmpurchases
- belongs_to :sizes
- belongs_to :conditions
- belongs_to :deliverydays
- belongs_to :shippingfees
- belongs_to :shippingmethods
- belongs_to :brands
- belongs_to :categoriesfirst
- belongs_to :categoriessecond
- belongs_to :categoriesthird
- belongs_to :prefectures
- has_many :comments
- has_many :likes
- has_many :users, through: :likes

## confirmpurchases
|column|type|options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|
- belongs_to :users
- belongs_to :products
- has_one :confirmpurchases

## todopurchases
|column|type|options|
|------|----|-------|
|confirm_purchase_id|integer|null: false, foreign_key: true|
- belongs_to :confirmpurchases

## conditionsテーブル
|column|type|options|
|------|----|-------|
|content|string|null: false|
|category_third_id|string|null: false, foreign_key: true|
- has_many :products

## commentsテーブル
|column|type|options|
|------|----|-------|
|from_user_id|integer|null: false, foreign_key: true|
|to_producr_id|integer|null: false, foreign_key: true|
|content|string|null: false|
- belongs_to :products

## messagesテーブル
|column|type|options|
|------|----|-------|
|from_user_id|integer|null: false, foreign_key: true|
|to_user_id|integer|null: false, foreign_key: true|
|content|string|null: false|
- belongs_to :users
- has_one :todomessages

## todomessagesテーブル
|column|type|options|
|------|----|-------|
|message_id|integer|null: false, foreign_key: true|
- belongs_to :messages

## valuations
|column|type|options|
|------|----|-------|
|to_user_id|integer|null: false, foreign_key: true|
|from_user_id|integer|null: false, foreign_key: true|
|valuation_option_id|integer|null: false, foreign_key: true|
- belongs_to :user
- belongs_to :valuationsoptions

## valuationsoptions
|column|type|options|
|------|----|-------|
|content|string|null:false|
- has_many :valuations

## sizesテーブル
|column|type|options|
|------|----|-------|
|content|string|null: false|
|category_third_id|integer|null: false, foreign_key: true|
- has_many :products

## deliverydaysテーブル
|column|type|options|
|------|----|-------|
|content|string|null: false|
- has_many :products


## shippingfeesテーブル
|column|type|options|
|------|----|-------|
|content|string|null: false|
- has_many :products


## shippingmethodsテーブル
|column|type|options|
|------|----|-------|
|content|string|null: false|
- has_many :products


## categories
|column|type|options|
|------|----|-------|
|name|string|null: false|
|ancestry|integer||
- has_many :products

## brands
|column|type|options|
|------|----|-------|
|name|string|null: false|
- has_many: products

## prefectures
|column|type|options|
|------|----|-------|
|name|string|null: false|
- has_many :products

## likes
|column|type|options|
|------|----|-------|
|to_product_id|integer|null: false, foreign_key: true|
|from_user_id|integer|null: false, foreign_key: true|
- belongs_to :products
- belongs_to :users

## points
|column|type|options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|point|integer|null: false|
- belongs_to :users

## contacts
|column|type|options|
|------|----|-------|
|content|string|null: false|

## aboutpurchases
|column|type|options|
|------|----|-------|
|product_id|integer|null: false, foreign_key: true|
|content|string|null: false|

## troubles
|column|type|options|
|------|----|-------|
|product_id|integer|null: false, foreign_key: true|
|content|string|null: false|

## mulfunctions
|column|type|options|
|------|----|-------|
|year|integer|null: false|
|month|integer|null: false|
|day|integer|null: false|
|hour|integer|null: false|
|minute|integer|null: false|
|frequency_id|integer|null: false, foreign_key: true|
|detail|string|null: false|
|product_name|string|null: false|
|what|string|null: false|
- belongs_to :frequency

## frequencies
|column|type|options|
|------|----|-------|
|contents|string|null: false|
- has_many :mulfunctions

## unsubscribe
|column|type|options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|reason_id|integer|null: false, foreign_key: true|
|reason_detail|string|null: false|
- belongs_to :reason

## reasons
|column|type|options|
|------|----|-------|
|content|string|null: false|
- has_many :unsubscribes