class Outdoor < ActiveRecord::Base
	belongs_to :media_company	
	validates :address, :code, presence: true
	mount_uploader :image, ImageUploader

	reverse_geocoded_by :latitude, :longitude
	after_validation :reverse_geocode, :if => :latitude_changed?
	#geocoded_by :address
	#after_validation :geocode, :if => :address_changed?
end
