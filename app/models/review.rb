class Review < ApplicationRecord
  belongs_to :adoption, dependent: :destroy
  belongs_to :user
end
