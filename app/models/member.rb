class Member < ActiveRecord::Base
  attr_accessible :age, :password, :sex, :username
end
