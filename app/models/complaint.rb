class Complaint < ActiveRecord::Base
  attr_accessible :complaint_text, :ward_id
end
