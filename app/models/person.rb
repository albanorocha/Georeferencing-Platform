class Person < ActiveRecord::Base
	has_one :user, dependent: :destroy
	belongs_to :profile, polymorphic: true

	accepts_nested_attributes_for :user
end
