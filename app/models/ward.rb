class Ward < ActiveRecord::Base
  attr_accessible :ward_num
	has_many :complaints
end