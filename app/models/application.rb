class Application < ApplicationRecord
  attr_accessor :submit_app

  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true
  validates :description, presence: true, if: :submit_app
  validates :status, presence: true, acceptance: { accept: ["In Progress", "Pending", "Accepted", "Rejected"] }

  has_many :pet_applications
  has_many :pets, through: :pet_applications

  def self.pending
    where(status: "Pending")
  end

  def all_pets_accepted?
    pet_applications.all? { |app| app.status == "Accepted" }
  end

  def no_pets_pending?
    pet_applications.all? { |app| app.status != "Pending" }
  end

  def any_pets_rejected?
    pet_applications.any? { |app| app.status == "Rejected" }
  end
end
