require 'rails_helper'

RSpec.describe Application, type: :model do
  describe 'relationships' do
    it { should have_many(:pet_applications) }
    it { should have_many(:pets) }
  end

  before(:each) do
    @app_1 = create(:random_application)
    @app_2 = create(:random_application)

    @pet_1 = create(:random_pet)
    @pet_2 = create(:random_pet)

    @app_1.pets << @pet_1
    @app_1.pets << @pet_2

    @app_1_pets = @app_1.pet_applications
  end

  describe 'instance methods' do
    describe '.all_accepted?' do
      it 'returns true if all pet application status are accepted' do
        expect(@app_1.all_pets_accepted?).to eq(false)
        @app_1_pets.map { |pet_app| pet_app.update(status: "Accepted") }
        expect(@app_1.all_pets_accepted?).to eq(true)
      end
    end
    describe '.no_pets_pending?' do
      it 'returns true if all pet application status are not pending' do
        expect(@app_1.no_pets_pending?).to eq(false)
        @app_1_pets.first.update(status: "Rejected")
        expect(@app_1.no_pets_pending?).to eq(false)
        @app_1_pets.map { |pet_app| pet_app.update(status: "Accepted") }
        expect(@app_1.no_pets_pending?).to eq(true)
      end
    end
    describe '.any_pets_rejected?' do
      it 'returns true if all pet application status are accepted' do
        expect(@app_1.any_pets_rejected?).to eq(false)
        @app_1_pets.first.update(status: "Rejected")
        expect(@app_1.any_pets_rejected?).to eq(true)
      end
    end
  end
end
