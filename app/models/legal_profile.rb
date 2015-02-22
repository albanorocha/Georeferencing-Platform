class LegalProfile < ActiveRecord::Base
	has_one :person, as: :profile, dependent: :destroy
	has_many :employee, class_name: "PhysicalProfile",
                          foreign_key: "employer_id"

	accepts_nested_attributes_for :person

	scope :media_companies, -> { where(type: 'MediaCompany') } 
	scope :contractors, -> { where(type: 'Contractor') } 

	def self.types
      %w(MediaCompany Contractor)
    end
end
