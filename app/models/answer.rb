class Answer < ActiveRecord::Base
  belongs_to :member
  belongs_to :question
  attr_accessible :ans, :comment, :member_id, :question_id
end
