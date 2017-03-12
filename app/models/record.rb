# top-level class documentation comment
class Record < ApplicationRecord
  belongs_to :user

  scope :closed, -> { where.not(finish_record: nil) }
end
