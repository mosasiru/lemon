class Member < ActiveRecord::Base
  belongs_to :user
  has_many :question
  has_many :answer
  attr_accessible :birthday, :sex, :user_id, :username
end
