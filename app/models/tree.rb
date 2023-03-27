class Tree < ApplicationRecord
  belongs_to :user
  has_many :adoptions, dependent: :destroy
end
