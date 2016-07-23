require 'rails_helper'

feature 'Book' do
  given(:user)            { create(:user) }
  given(:error_message)   { 'You are not authorized to perform this action' }
  given(:updated_status)  { 'Status is update' }
  given(:draft_title)     { 'To draft' }
  given(:publish_title)   { 'To publish' }

  background do
    visit root_path
    login(user)
  end

  describe 'moving to states' do
    context 'author actions' do
      given!(:book) { create(:book, user: user) }

      scenario 'move book to draft' do
        visit root_path
        expect(page).to have_content(book.title)
        expect(page).to have_content(draft_title)

        click_on draft_title
        expect(page).to have_content(updated_status)
      end

      scenario 'move book to publish' do
        book.drafting!
        visit root_path
        expect(page).to have_content(book.title)
        expect(page).to have_content(publish_title)

        click_on publish_title
        expect(page).to have_content(updated_status)
      end
    end

    context 'not author actions' do
      given!(:book) { create(:book) }

      scenario 'can not move book to draft or publish' do
        visit root_path
        expect(page).to have_content(book.title)
        expect(page).to_not have_content(draft_title)
        expect(page).to_not have_content(publish_title)
      end
    end
  end

  describe 'access to book' do
    given!(:book) { create(:book, aasm_state: 'draft') }

    scenario 'when book in draft and user not owner that book is unavailable' do
      visit root_path
      expect(page).to_not have_content(book.title)

      visit book_path(book)
      expect(page).to have_content(error_message)
    end
  end
end
