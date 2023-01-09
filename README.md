# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |

has_many :ltems
has_many :bye

## 商品 テーブル 
## ltems テーブル

| Column    | Type       | Options                        |
| -------   | ---------- | ------------------------------ |
| item_name | string     |                                |
| category  | references | null: false, foreign_key: true |
| price     | references | null: false, foreign_key: true |
| image     | references | null: false, foreign_key: true |
| user_id   | references | null: false, foreign_key: true |

belongs_to :users
has_many   :bye 

## 購入履歴 テーブル
## byes テーブル

| Column   | Type       | Options                        |
| -------  | ---------- | ------------------------------ |
| buyer    | string     |                                |
| delivery | references | null: false, foreign_key: true |
| user_id  | references |                                |
| ltems_id  | references |                                |

belongs_to :user
belongs_to :items
hae_one    :delivery_locations

## 配送先 テーブル
## delivery_locations テーブル

| Column    | Type   | Options     |
| --------  | ------ | ----------- |
| item_name | string | null: false |
| location  | string | null: false |

belongs_to :byes