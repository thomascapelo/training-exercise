class Review < ApplicationRecord
  belongs_to :adoption, dependent: :destroy
  belongs_to :user

  # validates :rating, :content, presence: true
  # validates :rating, :numericality{ only_integer: true, in: 0..5 }
  # validates :content, :length{ less_than: 3, greater_than:114 }
end
