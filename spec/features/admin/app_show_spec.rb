require 'rails_helper'

describe 'admin application show page' do
  before :each do
    @app_1 = create(:random_application, status: "Pending")
    @pet = create(:random_pet, adoptable: true)
    @app_1.pets << @pet
  end

  it 'shows the applicant information' do
    visit "admin/applications/#{@app_1.id}"

    expect(page).to have_content(@app_1.name)
    expect(page).to have_content(@app_1.address)
    expect(page).to have_content(@app_1.city)
    expect(page).to have_content(@app_1.state)
    expect(page).to have_content(@app_1.zip_code)
    expect(page).to have_content(@app_1.description)
  end

  it 'does not show accept or rejectfrom the start' do
    visit "admin/applications/#{@app_1.id}"

    expect(page).to_not have_content("Accepted")
    expect(page).to_not have_content("Rejected")
    expect(page).to have_button("Adopt this Pet")
    expect(page).to have_button("Reject this Pet")
  end

  it 'shows accepted for the pet once the accept button is pressed' do
    visit "admin/applications/#{@app_1.id}"

    click_on("Adopt this Pet")

    expect(page).to have_content("Accepted")
    expect(page).to_not have_button("Adopt this Pet")
  end

  it 'shows rejected for the pet once the reject button is pressed' do
    visit "admin/applications/#{@app_1.id}"

    click_on("Reject this Pet")

    expect(page).to have_content("Rejected")
    expect(page).to_not have_button("Reject this Pet")
  end

  describe 'updates status once all pet_apps are checked' do
    it 'has status as accepted if all apps are accepted' do
      visit "admin/applications/#{@app_1.id}"

      expect(page).to have_content("Status: Pending")

      click_on("Adopt this Pet")

      expect(page).to have_content("Status: Accepted")
    end

    it 'has status as rejected if any apps are rejected' do
      pet_2 = create(:random_pet, adoptable: true)
      @app_1.pets << pet_2

      visit "admin/applications/#{@app_1.id}"

      expect(page).to have_content("Status: Pending")

      within "#pet-#{@pet.id}" do
        click_on("Adopt this Pet")
      end

      expect(page).to have_content("Status: Pending")

      click_on("Reject this Pet")

      expect(page).to have_content("Status: Rejected")
    end
  end
end