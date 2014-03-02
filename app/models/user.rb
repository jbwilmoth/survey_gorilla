class User < ActiveRecord::Base
  has_many :surveys, foreign_key: 'creator_id'
  has_many :responses, foreign_key: 'taker_id'
  has_many :questions, through: :surveys
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  validates :password, presence: true
end
