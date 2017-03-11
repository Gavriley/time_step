class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:user, :manager, :admin]

  has_many :records
  belongs_to :team

  def current_record
    records.where(finish_record: nil).first
  end

end
