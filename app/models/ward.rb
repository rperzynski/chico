class Ward < ActiveRecord::Base
  attr_accessible :ward_num
	has_many :complaints


	def alderman
    find_ward.alderman.titleize
  end

  def alderman_phone
    find_ward.ward_phone[0]
  end

	def alderman_address
		find_ward.address.titleize
  end

	def alderman_city
		find_ward.city.titleize
	end
	def alderman_state
		find_ward.state.titleize
	end
	def alderman_zipcode
		find_ward.zipcode.titleize
	end

	def alderman_location
		find_ward.location[0]
	end	

	def alderman_email
		find_ward.email
	end

	def alderman_website
		find_ward.website[0]
	end

  private

  # htai-wnw4 is the ward info identifying URL fragment, e.g.:
  # http://data.cityofchicago.org/api/views/htai-wnw4/rows.json

  def ward_info
    Windy.app_token = "SzhuGRMWyG4gCUf08KDa693CK"
    Windy.views.find_by_id('htai-wnw4').rows
	end
	
	def ward_map
		Windy.app_token = "SzhuGRMWyG4gCUf08KDa693CK"
		Windy.views.find_by_id('8yti-tif4')
	end

  def find_ward
    ward_info.find_by_ward(id.to_s)
  end


end







