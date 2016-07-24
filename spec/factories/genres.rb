FactoryGirl.define do
  factory :genre do
    title { FFaker::Music.genre }
  end
end
