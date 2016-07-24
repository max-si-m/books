require 'rails_helper'

feature 'Admin books' do
  given(:admin_user)    { create(:admin_user) }
  given!(:genre)        { create(:genre) }
  given(:book)          { build(:book) }

  before(:each) do
    visit admin_books_path
    login(admin_user, scope: :admin_user)
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
    end

    context 'when book is created' do
      before(:each) do
        book.save
        visit admin_books_path
      end

      scenario 'edit book' do
        click_on 'Edit'
        fill_in 'book_title', with: 'Some new title'

        click_on 'Update Book'
        expect(page).to have_content('Some new title')
      end

      scenario 'delete book' do
        click_on 'Delete'
        expect(page).to_not have_content(book.title)
      end
    end
  end
end
