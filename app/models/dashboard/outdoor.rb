class Dashboard::Outdoor < ActiveRecord::Base
	validates :address, :code, :company, presence: true
	mount_uploader :image, ImageUploader

	reverse_geocoded_by :latitude, :longitude
	after_validation :reverse_geocode, :if => :latitude_changed?
	geocoded_by :address
	after_validation :geocode, :if => :address_changed?
end
