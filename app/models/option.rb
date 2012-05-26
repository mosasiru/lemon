class Option < ActiveRecord::Base
  belongs_to :question
  attr_accessible :question_id, :string
   validates :string,  :presence => true
#   validates :question_id,  :presence => true
end
