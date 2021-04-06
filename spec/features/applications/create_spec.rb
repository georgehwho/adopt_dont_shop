require 'rails_helper'

RSpec.describe 'application creation' do
  describe 'new application' do
    it 'renders a new form' do
      visit "/pets"

      click_link 'Start an Application'

      expect(current_path).to eq('/applications/new')

      expect(page).to have_content('New Application')
      expect(find('form')).to have_content('Name')
      expect(find('form')).to have_content('Address')
      expect(find('form')).to have_content('State')
      expect(find('form')).to have_content('City')
      expect(find('form')).to have_content('Zip code')
      expect(find('form')).to have_content('Description')
    end
  end

  describe 'create application' do
    it 'creates the application then redirects to the application show page' do
      visit "/applications/new"

      fill_in 'Name', with: 'Bumblebee'
      fill_in 'Address', with: '101 hello'
      fill_in 'State', with: 'ma'
      fill_in 'City', with: 'boston'
      fill_in 'Zip code', with: '02142'
      fill_in 'Description', with: 'this is a good person'
      click_button 'Save'

      expect(current_path).to have_content("/applications")
    end
  end
end