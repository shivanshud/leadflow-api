class User < ApplicationRecord
  has_secure_password
  
  has_many :assignments, dependent: :destroy
  has_many :leads, through: :assignments

  validates :email, presence: true, uniqueness: true
  validates :role, inclusion: { in: %w[admin agent] }

  validates :regions, length: {
    maximum: 3,
    message: "can only have max 3 regions"
  }

  enum skill_level: {
    junior: 0,
    mid: 1,
    senior: 2
  }

  scope :available_agents, -> {
    where(role: 'agent', available: true)
      .where("active_leads_count < capacity")
  }
end