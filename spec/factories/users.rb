FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'aa@aa'}
    password              {'abc000'}
    password_confirmation {'abc000'}
    family_name           {"本城"}
    first_name            {"敏吾"}
    family_name_kana      {"ホンジョウ"}
    first_name_kana       {"ビンゴ"}
    birthday              {"1998-02-20"}
  end
end