class Application < ApplicationRecord
  validates :status, acceptance: { accept: ["In Progress", "Pending", "Accepted", "Rejected"] }

  belongs_to :applicant
  belongs_to :pet
end
