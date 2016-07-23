require 'rails_helper'

feature 'Books' do
  given(:user)    { create(:user) }
  given!(:genre)  { create(:genre) }
  given(:book)    { build(:book, user: user) }

  before(:each) do
    visit root_path
    login(user)
  end

  describe 'Authenticated user try to' do
    scenario 'create book' do
      click_on 'New Book'

      fill_in 'book_title', with: book.title
      fill_in 'book_author', with: book.author
      fill_in 'book_logo', with: book.logo
      fill_in 'book_description', with: book.description
      select genre.title, from: 'book_genre_ids'

      click_on 'Create Book'

      expect(page).to have_content(book.title)
      expect(page).to have_content(book.author)
      expect(page).to have_content(book.description)
      expect(page).to have_content(genre.title)
    end

    scenario 'edit book' do
      book.save
      visit edit_book_path(book)

      fill_in 'book_title', with: 'Some new title'

      click_on 'Update Book'
      expect(page).to have_content('Some new title')
    end

    scenario 'delete book' do
      book.save
      visit books_path

      click_on 'Delete'
      expect(page).to_not have_content(book.title)
    end
  end

  describe 'Not owner of the book try to' do
    given!(:book)  { create(:book) }
    given(:error_message) { 'You are not authorized to perform this action' }

    scenario 'edit book' do
      visit edit_book_path(book)

      expect(page).to have_content(error_message)
    end

    scenario 'delete book' do
      expect(page).to_not have_content('Delete')

      delete book_path(book)
      visit root_path
      expect(page).to have_content(book.title)
    end
  end
end
