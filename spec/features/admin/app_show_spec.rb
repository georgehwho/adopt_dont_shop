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

  it 'does not show accept from the start' do
    visit "admin/applications/#{@app_1.id}"

    expect(page).to_not have_content("Accepted")
    expect(page).to have_button("Adopt this Pet")
  end

  it 'shows accepted for the pet once the button is pressed' do
    visit "admin/applications/#{@app_1.id}"

    click_on("Adopt this Pet")

    expect(page).to have_content("Accepted")
    expect(page).to_not have_button("Adopt this Pet")
  end
end