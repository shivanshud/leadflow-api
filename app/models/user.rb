class User < ApplicationRecord
  has_many :assignments, dependent: :destroy
  has_many :leads, through: :assignments

  validates :email, presence: true, uniqueness: true
  validates :role, inclusion: { in: %w[admin agent] }

  scope :available_agents, -> {
    where(role: 'agent', available: true)
  }
end