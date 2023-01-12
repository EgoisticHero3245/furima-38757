FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'000000'}
    password_confirmation {password}
    family_name           {"honjo"}
    first_name            {"bingo"}
    family_name_kana      {"honjo"}
    first_name_kana       {"bingo"}
    birthday              {"1998-02-20"}
  end
end