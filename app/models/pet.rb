class Pet < ApplicationRecord
  validates :name, presence: true
  validates :age, presence: true, numericality: true

  belongs_to :shelter

  has_many :pet_applications
  has_many :applications, through: :pet_applications

  def shelter_name
    shelter.name
  end

  def self.adoptable
    where(adoptable: true)
  end

  def toggle_adoptable
    toggle!(:adoptable)
  end

  def self.with_approved_applications
    joins(:applications).where("applications.status='Accepted'").count
  end
end
