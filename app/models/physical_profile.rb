class PhysicalProfile < ActiveRecord::Base
	has_one :person, as: :profile, dependent: :destroy
	belongs_to :employer, class_name: "LegalProfile"

	accepts_nested_attributes_for :person

	scope :managers, -> { where(type: 'Manager') } 
	scope :secretaries, -> { where(type: 'Secretary') } 

	def self.types
      %w(Manager Secretary)
    end
end
