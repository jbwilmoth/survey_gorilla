class Choice < ActiveRecord::Base
  belongs_to :user
  belongs_to :response
  has_one :survey, through: :response
end
