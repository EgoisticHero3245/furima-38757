FactoryBot.define do
  factory :delivery_location do

    postal_code     {'123-4567'}
    shipper_id      {'2'}
    municipalities  {'豊島区'}
    address         {'鏑木2-3'}
    building_name   {'大河ビル'}
    telephone_number{'01234567890'}
    token           {'tok000o0o0000o0'}
  end
end
