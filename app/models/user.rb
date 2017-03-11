# top-level class documentation comment
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:user, :manager, :admin]

  has_many :records
  belongs_to :team

  def current_record
    records.find_by(finish_record: nil)
  end
end
