class Tree < ApplicationRecord
  belongs_to :user
  has_one :adoption, dependent: :destroy
  has_one_attached :photo

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  FRUIT_TYPES = ["Apple", "Apricot", "Cherry", "Chestnut", "Coconut tree", "Fig", "Grapefruit", "Hazel", "Mandarin", "Mango", "Mirabellier", "Mulberry", "Olivier", "Orange", "Pear", "Plum"]
  validates :name, :address, :fruit_type, :description, :price_per_year, :quantity_per_year, presence: true
  validates :fruit_type, inclusion: {in: FRUIT_TYPES}
  validates :description, length: { in: 20..280 }
  validates :quantity_per_year, numericality: { greater_than: 0 }
  validates :price_per_year, numericality: { greater_than: 0 }
end
