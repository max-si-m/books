# FFaker don't have genres for books, I should make PR :)
FactoryGirl.define do
  factory :genre do
    title { FFaker::Music.genre }
  end
end
