require 'rails_helper'

describe 'admin shelter show' do
  describe 'it can be accessed from the admin page' do
    it 'accessed the admin shelter show page' do
      shelter = create(:random_shelter)
      shelter.pets << create(:random_pet)
      visit "/admin/shelters"

      click_on shelter.name

      expect(page).to have_current_path("/admin/shelters/#{shelter.id}")
    end
  end
end