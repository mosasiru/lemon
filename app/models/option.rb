class Option < ActiveRecord::Base
  belongs_to :question
  attr_accessible :question_id, :string
end
