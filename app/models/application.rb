class Application < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true
  validates :description, presence: true
  validates :status, presence: true, acceptance: { accept: ["In Progress", "Pending", "Accepted", "Rejected"] }

  has_many :pet_applications
  has_many :pets, through: :pet_applications
end
