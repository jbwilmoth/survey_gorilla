class User < ActiveRecord::Base
<<<<<<< HEAD
  has_many :surveys, foreign_key: "creator_id"
  has_many :responses, foreign_key: "taker_id"
=======
  has_many :surveys, foreign_key: 'creator_id'
  has_many :responses, foreign_key: 'taker_id'
>>>>>>> Ability to add one question to a survey added
  has_many :questions, through: :surveys
  has_secure_password
end
