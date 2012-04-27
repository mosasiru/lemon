class Answer < ActiveRecord::Base
  attr_accessible :ans, :comment, :member_id, :question_id
end
