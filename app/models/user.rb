class User < ActiveRecord::Base
  has_many :surveys, source: :creator
  has_many :responses, source: :taker
  has_many :questions, through: :surveys
  has_secure_password
end
