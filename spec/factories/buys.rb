FactoryBot.define do
  factory :buy do

    user            {'本城'}
    item
    postal_code     {'123-4567'}
    shipper_id      {'2'}
    municipalities  {'茅ヶ崎市'}
    address         {'鏑木2-3'}
    building_name   {'大河ビル'}
    telephone_number{'01234567890'}
    
  end
end