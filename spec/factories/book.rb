FactoryGirl.define do
  factory :book do
    title       { FFaker::CheesyLingo.title }
    author      { FFaker::Name.name }
    logo        { 'https://robohash.org/laboruminquisquam.png' }
    description { FFaker::HipsterIpsum.paragraph }
  end
end
