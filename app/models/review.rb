class Review < ApplicationRecord
  belongs_to :user
  belongs_to :camera

  validates :rating, presence: true, numericality: { only_integer: true, in: 1..5 }
  validates :comment, presence: true
end
