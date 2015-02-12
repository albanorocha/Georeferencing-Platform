class LegalProfile < ActiveRecord::Base
	has_one :person, as: :profile, dependent: :destroy

	accepts_nested_attributes_for :person

	scope :media_companies, -> { where(type: 'MediaCompany') } 
	scope :contractors, -> { where(type: 'Contractor') } 

	def self.types
      %w(MediaCompany Contractor)
    end
end
