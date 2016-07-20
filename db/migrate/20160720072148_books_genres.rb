class BooksGenres < ActiveRecord::Migration[5.0]
  def change
    create_table :books_genres, id: false do |t|
      t.belongs_to :genre, index: true
      t.belongs_to :book, index: true
    end
  end
end
