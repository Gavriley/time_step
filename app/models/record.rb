class Record < ApplicationRecord
  belongs_to :user

  scope :closed, -> { where.not(finished_at: nil).order(started_at: :desc) }

  validate :open_record, on: :create
  validate :closed_record, on: :update

  private

  def open_record
    mes = 'You have already started to work'
    errors.add(:record, mes) if user.records.exists?(finished_at: nil)
  end

  def closed_record
    mes = 'You have already finished to work'
    errors.add(:record, mes) if finished_at_was.present?
  end
end
