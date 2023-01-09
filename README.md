# テーブル設計

## users テーブル

| Column             | Type   | Options                 |
| ------------------ | ------ | ----------------------- |
| nickname           | string | null: false             |
| email              | string | null: false unique:true |
| encrypted_password | string | null: false             |
| family_name        | string | null: false             |
| first_name         | string | null: false             |
| family_name_kana   | string | null: false             |
| first_name_kana    | string | null: false             |
| birthday           | date   | null: false             |

has_many :items
has_many :buys

## 商品 テーブル 
## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| price              | integer    | null: false                    |
| explanation_text   | text       | null: false                    |
| category_id        | integer    | null: false                    |
| state_id           | integer    | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| shipper_id         | integer    | null: false                    |
| shipping_date_id   | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

belongs_to :user
has_one    :buy

## 購入履歴 テーブル
## buys テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

belongs_to :user
belongs_to :item
has_one    :delivery_location

## 配送先 テーブル
## delivery_locations テーブル

| Column             | Type       | Options     |
| ------------------ | -----------| ----------- |
| postal_code        | string     | null: false |
| shipper_id         | integer    | null: false |
| municipalities     | string     | null: false |
| address            | string     | null: false |
| building_name      | string     |             |
| telephone_number   | string     | null: false |
| buy                | references | null: false, foreign_key: true |


belongs_to :bye