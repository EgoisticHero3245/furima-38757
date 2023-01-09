# テーブル設計

## users テーブル

| Column             | Type   | Options                 |
| ------------------ | ------ | ----------------------- |
| nickname           | string | null: false             |
| email              | string | null: false unique:true |
| encrypted_password | string | null: false             |
| family_name        | string | null: false             |
| first_name         | string | null: false             |
| birthday_year      | string | null: false             |
| birthday_month     | string | null: false             |
| birthday_day       | string | null: false             |

has_many :items
has_many :bye

## 商品 テーブル 
## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false, foreign_key: true |
| price              | references | null: false                    |
| explanation_text   | references | null: false,                   |
| nickname           | references | null: false, foreign_key: true |
| category_id        | references | null: false                    |
| state_id           | references | null: false                    |
| delivery_charge_id | references | null: false                    |
| shipper_id         | references | null: false                    |
| shipping_date_id   | references | null: false                    |
| user               | references | null: false, foreign_key: true |

belongs_to :user
has_one    :bye

## 購入履歴 テーブル
## byes テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| items     | references | null: false, foreign_key: true |

belongs_to :user
belongs_to :item
has_one    :delivery_location

## 配送先 テーブル
## delivery_locations テーブル

| Column             | Type       | Options     |
| ------------------ | -----------| ----------- |
| postal_code        | string     | null: false |
| shipper_id         | references | null: false |
| municipalities     | string     | null: false |
| address            | string     | null: false |
| telephone_number   | string     | null: false |

belongs_to :bye