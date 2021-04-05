require 'rails_helper'

RSpec.describe Applicant, type: :model do
  describe 'relationships' do
    it { should have_many(:applications) }
    it { should have_many(:pets) }
  end
end
