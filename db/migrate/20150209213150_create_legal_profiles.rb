class CreateLegalProfiles < ActiveRecord::Migration
  def change
    create_table :legal_profiles do |t|
      t.integer :cnpj

      t.timestamps
    end
  end
end
