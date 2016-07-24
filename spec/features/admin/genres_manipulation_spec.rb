require 'rails_helper'

feature 'Genres manipulation' do
  given(:admin_user)    { create(:admin_user) }
  given(:genre)         { build(:genre) }

  before(:each) do
    visit admin_genres_path
    login(admin_user, scope: :admin_user)
  end

  describe 'admin user try to' do
    scenario 'create genre' do
      click_on 'New Genre'

      fill_in 'genre_title', with: genre.title
      click_on 'Create Genre'

      expect(page).to have_content(genre.title)
      expect(page).to have_content(genre.slug)
    end

    context 'when genre is created' do
      before(:each) do
        genre.save
        visit admin_genres_path
      end

      scenario 'edit genre' do
        click_on 'Edit'
        fill_in 'genre_title', with: 'Some new title'

        click_on 'Update Genre'
        expect(page).to have_content('Some new title')
        expect(page).to have_content('some-new-title')
      end

      scenario 'delete genre' do
        click_on 'Delete'
        expect(page).to_not have_content(genre.title)
      end
    end
  end
end
