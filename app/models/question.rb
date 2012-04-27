class Question < ActiveRecord::Base
  attr_accessible :category_id, :member_id, :text, :title
end
