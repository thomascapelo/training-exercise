class Adoption < ApplicationRecord
  belongs_to :tree
  belongs_to :user
  has_one :review, dependent: :destroy

  validates :starts_at, :ends_at, presence: true
end
