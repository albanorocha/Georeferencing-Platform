class PhysicalProfile < ActiveRecord::Base
	has_one :person, as: :profile, dependent: :destroy

	accepts_nested_attributes_for :person

	scope :manager, -> { where(type: 'Manager') } 
	scope :Secretary, -> { where(type: 'Secretary') } 

	def self.types
      %w(Manager Secretary)
    end
end
