class Lead < ApplicationRecord
  has_many :assignments, dependent: :destroy
  has_many :users, through: :assignments

  validates :name, :phone, presence: true

  validates :language, inclusion: {
    in: %w[
      Hindi English Marathi Tamil Telugu
      Kannada Gujarati Bengali Punjabi Urdu
    ]
  }, allow_nil: true

  validates :region, inclusion: {
    in: %w[
      Mumbai Delhi Bangalore Hyderabad Chennai
      Pune Kolkata Ahmedabad Jaipur Lucknow
    ]
  }, allow_nil: true
end