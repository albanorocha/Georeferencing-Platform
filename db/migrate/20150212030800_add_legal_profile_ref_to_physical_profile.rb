class AddLegalProfileRefToPhysicalProfile < ActiveRecord::Migration
  def change
    add_reference :physical_profiles, :employer, index: true
  end
end
