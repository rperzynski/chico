class Complaint < ActiveRecord::Base
  attr_accessible :complaint_text, :ward_id
	belongs_to :ward
		validates :complaint_text, :presence => true
end
