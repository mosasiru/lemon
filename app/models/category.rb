class Category < ActiveRecord::Base
  has_many :question
  attr_accessible :name
end
