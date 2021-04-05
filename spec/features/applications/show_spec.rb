require 'rails_helper'

RSpec.describe 'the application show' do
  before :each do
    @pet = create(:random_pet)
    @application = create(:random_application)
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
end
