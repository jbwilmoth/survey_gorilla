class User < ActiveRecord::Base
  has_many :surveys, foreign_key: "creator_id"
  has_many :responses, foreign_key: "taker_id"
  has_many :questions, through: :surveys
  has_secure_password
end
