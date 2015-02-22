class AddTypeToLegalProfile < ActiveRecord::Migration
  def change
    add_column :legal_profiles, :type, :string
  end
end
