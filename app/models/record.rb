class Record < ApplicationRecord
  belongs_to :user

  scope :closed, -> { where.not(finished_at: nil) }

  validate :open_record, on: :create
  validate :closed_record, on: :update

  private

  def open_record
    errors.add(:record, 'You have already started to work') if user.records.exists?(finished_at: nil)
  end

  def closed_record
    errors.add(:record, 'You have already finished to work') if finished_at_was.present?
  end
end
