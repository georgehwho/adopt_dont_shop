require 'rails_helper'

describe 'admin shelter page' do
  before :each do
    @shelter_1 = create(:random_shelter, name: 'A')
    @shelter_2 = create(:random_shelter, name: 'B')
    @shelter_3 = create(:random_shelter, name: 'C')
    @pet_1 = create(:random_pet, shelter: @shelter_1)
    @app_1 = create(:random_application, status: "Pending")
    @app_1.pets << @pet_1
  end

  it 'list all shelters' do
    visit "/admin/shelters"

    within "#all-shelters" do
      expect(@shelter_3.name).to appear_before(@shelter_2.name)
      expect(@shelter_2.name).to appear_before(@shelter_1.name)
    end
  end

  it 'shows shelters with pending applications' do
    visit "/admin/shelters"

    within "#pending-shelters" do
      expect(page).to have_content(@shelter_1.name)
      expect(page).to_not have_content(@shelter_2.name)
    end
  end
end