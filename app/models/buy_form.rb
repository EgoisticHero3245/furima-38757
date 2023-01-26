class BuyForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :shipper_id, :municipalities, :address, :building_name, :telephone_number, :token

  #空の投稿を保存できないようにする
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/}
    validates :shipper_id
    validates :municipalities
    validates :address
    validates :telephone_number, format: { with: /\A[0-9]{11}\z/}
  end

    #ジャンルの選択が「---」の時は保存できないようにする
    validates :shipper_id, numericality: { other_than: 1 , message: "can't be blank"}

  def save
    # 各テーブルにデータを保存する処理
    buy = Buy.create(user_id: user_id, item_id: item_id)

    # 住所を保存
    DeliveryLocation.create(buy_id: buy.id, postal_code: postal_code, shipper_id: shipper_id, municipalities: municipalities, address: address, building_name: building_name, telephone_number: telephone_number)
  end
end