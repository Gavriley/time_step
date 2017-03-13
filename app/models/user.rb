# top-level class documentation comment
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:user, :manager, :admin]

  has_many :records
  belongs_to :team, { :optional => true }

  def last_open_record
    records.find_by(finished_at: nil)
  end
  
end
