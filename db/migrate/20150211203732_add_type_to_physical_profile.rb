class AddTypeToPhysicalProfile < ActiveRecord::Migration
  def change
    add_column :physical_profiles, :type, :string
  end
end
