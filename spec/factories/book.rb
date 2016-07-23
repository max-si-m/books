FactoryGirl.define do
  factory :book do
    title       { FFaker::CheesyLingo.title }
    author      { FFaker::Name.name }
    logo        { FFaker::Avatar.image }
    description { FFaker::HipsterIpsum.paragraph }
  end
end
