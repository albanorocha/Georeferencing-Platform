class Dashboard::Outdoor < ActiveRecord::Base
	geocoded_by :address
	after_validation :geocode, :if => :address_changed?

	def self.printMarkers
		markers = ""
		Outdoor.all.each do |outdoor|
			markers += "&markers=#{outdoor.latitude}%2C#{outdoor.longitude}" 
		end
		
		markers
	end

end
