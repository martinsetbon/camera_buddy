class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :camera

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, presence: true, inclusion: { in: %w[pending accepted finished] }
  validate :end_date_after_start_date

  # Custom validation to ensure the end date is after the start date
  def end_date_after_start_date
    if end_date.present? && start_date.present? && end_date <= start_date
      errors.add(:end_date, "must be after the start date")
    end
  end
end
