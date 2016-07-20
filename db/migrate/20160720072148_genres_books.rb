class GenresBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :genres_books, id: false do |t|
      t.belongs_to :genre, index: true
      t.belongs_to :book, index: true
    end
  end
end
