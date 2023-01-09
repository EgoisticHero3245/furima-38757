# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

has_many :list
has_many :bye

## 商品 テーブル 
## list テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| name    | string     |                                |
| user    | references | null: false, foreign_key: true |
| price   | references | null: false, foreign_key: true |

belongs_to :users
has_many   :bye 

## 購入履歴 テーブル
## bye テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| name    | string     |                                |
| user    | references | null: false, foreign_key: true |

belongs_to :user
