class Question < ActiveRecord::Base
  belongs_to :member
  belongs_to :category
  has_many :answers
  has_many :options
  attr_accessible :category_id, :member_id, :text, :title
end
