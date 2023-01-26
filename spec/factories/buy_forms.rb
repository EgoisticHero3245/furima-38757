FactoryBot.define do
  factory :buy_form do
    
  token           { Faker::Internet.password(min_length: 20, max_length: 30) }
  postal_code     {'123-4567'}
  shipper_id      {'2'}
  municipalities  {'豊島区'}
  address         {'鏑木2-3'}
  building_name   {'大河ビル'}
  telephone_number{'01234567890'}

    end
  end
