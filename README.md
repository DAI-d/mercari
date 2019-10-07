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
- has_one :card, dependent: :destroy
- has_many :valuations, dependent: :destroy
- has_many :messages, dependent: :destroy
- has_many :products, dependent: :destroy
- has_many :points, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :confirmpurchases, dependent: :destroy
- has_one :address, dependent: :destroy

## address テーブル
|column|type|options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|postalcode|integer|null: false|
|prefecture_id|integer|null: false, foreign_key: true|
|city|string|null: false|
|address|string|null: false|
|building_name|string||
- belongs_to :user

## cardsテーブル
|column|type|options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|card_number|integer|null: false|
|expiration_date|integer|null: false|
|security_code|integer|null: false|
- belongs_to :user

## productsテーブル
|column|type|options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
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
- has_many :confirmpurchases
- belongs_to :size
- belongs_to :condition
- belongs_to :deliveryday
- belongs_to :shippingfee#0295EE
- belongs_to :shippingmethod
- belongs_to :brand
- belongs_to :category
- belongs_to :prefecture
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :users, through: :likes, dependent: :destroy
- has_many :images

## images
|column|type|options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|image|string|null: false|
- belongs_to :user



## confirmpurchases
|column|type|options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|
- belongs_to :users
- belongs_to :product
- has_one :todopurchase

## todopurchases
|column|type|options|
|------|----|-------|
|confirm_purchase_id|integer|null: false, foreign_key: true|
- belongs_to :confirmpurchase

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
- belongs_to :product

## messagesテーブル
|column|type|options|
|------|----|-------|
|from_user_id|integer|null: false, foreign_key: true|
|to_user_id|integer|null: false, foreign_key: true|
|content|string|null: false|
- belongs_to :user
- has_one :todomessage

## todomessagesテーブル
|column|type|options|
|------|----|-------|
|message_id|integer|null: false, foreign_key: true|
- belongs_to :message

## valuations
|column|type|options|
|------|----|-------|
|to_user_id|integer|null: false, foreign_key: true|
|from_user_id|integer|null: false, foreign_key: true|
|valuation_option_id|integer|null: false, foreign_key: true|
- belongs_to :user
- belongs_to :valuationsoption

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