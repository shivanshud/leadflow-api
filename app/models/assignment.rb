class Assignment < ApplicationRecord
  belongs_to :user
  belongs_to :lead

  validates :status, presence: true
end