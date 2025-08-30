FactoryBot.define do
  factory :user do
    transient { jp_name { Gimei.name } }

    nickname              {Faker::Name.name}
    email                 {Faker::Internet.unique.email}
    password              {"1a" + Faker::Internet.password(min_length: 4)}
    password_confirmation {password}
    first_name            { jp_name.first.kanji}
    last_name             { jp_name.last.kanji}
    first_name_kana       { jp_name.first.katakana}
    last_name_kana        { jp_name.last.katakana}
    birth_date            { Faker::Date.birthday(min_age: 18, max_age: 65) }


    trait :hiragana_name do
      # ひらがなのみ（2〜6文字）
      first_name { jp_name.first.hiragana }
      last_name  { jp_name.last.hiragana }
    end

     trait :katakana_name do
      # カタカナのみ（2〜6文字）。
      first_name { jp_name.first.katakana }
      last_name  { jp_name.last.katakana }
    end
  end 
end