class Member < ActiveRecord::Base
  belongs_to :user
  has_many :questions
  has_many :answers
  attr_accessible :birthday, :sex, :user_id, :username
end
