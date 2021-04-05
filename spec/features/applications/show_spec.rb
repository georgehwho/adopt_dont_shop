require 'rails_helper'

RSpec.describe 'the application show' do
  before :each do
    @pet = create(:random_pet)
    @application = create(:random_application)
    @application.pets << @pet
  end

  it "shows the application and all it's attributes" do
    binding.pry
    visit "/application/#{@application.id}"

    expect(page).to have_content(@applicant.name)
    expect(page).to have_content(@applicant.address)
    expect(page).to have_content(@applicant.city)
    expect(page).to have_content(@applicant.state)
    expect(page).to have_content(@applicant.zip_code)
    expect(page).to have_content(@application.description)
    expect(page).to have_content(@application.status)
  end
end
