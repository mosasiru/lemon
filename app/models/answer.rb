class Answer < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :ans, :comment, :question_id, :member_id
end
