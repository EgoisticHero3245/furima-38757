class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :state
  belongs_to :category
  belongs_to :delivery_charge
  belongs_to :shipper
  belongs_to :shipping_date

  belongs_to :user
  # has_one    :buy
  has_one_attached :image

  #300円以上かつ9,999,999円以下かつ、半角数字のみ
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  #空の投稿を保存できないようにする
  with_options presence: true do
    validates :user_id
    validates :item_name
    validates :image
    validates :price
    validates :explanation_text
    validates :category_id
    validates :state_id
    validates :delivery_charge_id
    validates :shipper_id
    validates :shipping_date_id
  end


  #ジャンルの選択が「---」の時は保存できないようにする
  validates :state_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_charge_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipper_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_date_id, numericality: { other_than: 1 , message: "can't be blank"}
end
