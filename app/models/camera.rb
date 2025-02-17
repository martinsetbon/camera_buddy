class Camera < ApplicationRecord
  BRANDS = ['Sony', 'Canon', 'Nikon', 'Fujifilm']
  MODEL_NAMES = ['Alpha 7', 'EOS R', 'Z6', 'X-T4']
  validates :brand, presence: true, inclusion: { in: MODEL_NAMES }
  validates :model_name, presence: true, inclusion: { in: MODEL_NAMES }
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }

  # Associations
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_many :reviews, dependent: :destroy
end
