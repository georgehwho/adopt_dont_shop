class Application < ApplicationRecord
  validates :status, acceptance: { accept: ["In Progress", "Pending", "Accepted", "Rejected"] }

  has_many :pet_applications
  has_many :pets, through: :pet_applications
end
