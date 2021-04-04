class Applicant < ApplicationRecord
  has_many :applications
  has_many :pets, through: :applications
end
