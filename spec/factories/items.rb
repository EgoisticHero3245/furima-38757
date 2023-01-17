FactoryBot.define do
  factory :item do

    association :user

    item_name           {'かめ'}
    price               {'10000'}
    explanation_text    {'かめかめしています'}
    category_id         {'2'}
    state_id            {'2'}
    delivery_charge_id  {'2'}
    shipper_id          {'2'}
    shipping_date_id    {'2'}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
