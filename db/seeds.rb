# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(
  email: "user@user.user",
  password: "1111111111",
  password_confirmation: "1111111111")

# Find genres here http://reference.yourdictionary.com/books-literature/different-types-of-books.html
genres = ["Science fiction","Satire","Drama","Action and Adventure","Romance",
          "Mystery","Horror","Self help","Health","Guide","Travel","Children's",
          "Religion, Spirituality & New Age","Science","History","Math",
          "Anthology","Poetry","Encyclopedias","Dictionaries","Comics","Art",
          "Cookbooks","Diaries","Journals","Prayer books","Series","Trilogy",
          "Biographies","Autobiographies","Fantasy"]
genres.each do |g|
  Genre.create!(title: g)
end
