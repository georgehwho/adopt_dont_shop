require 'rails_helper'

RSpec.describe 'the application show' do
  before :each do
    @pet = create(:random_pet)
    @pet_2 = create(:random_pet, adoptable: true)
    @application = create(:random_application, status: "In Progress")
    @application.pets << @pet
  end

  it "shows the application and all it's attributes" do
    visit "/applications/#{@application.id}"

    expect(page).to have_content(@application.name)
    expect(page).to have_content(@application.address)
    expect(page).to have_content(@application.city)
    expect(page).to have_content(@application.state)
    expect(page).to have_content(@application.zip_code)
    expect(page).to have_content(@application.description)
    expect(page).to have_link(@pet.name)
    expect(page).to have_content(@application.status)
  end

  it 'has a working pet search bar' do
    visit "/applications/#{@application.id}"

    expect(page).to have_button("Search")
    expect(page).to have_content(@pet_2.name)

    fill_in 'Search', with: @pet.name
    click_on("Search")
    expect(page).to_not have_content(@pet_2.name)
  end
end
