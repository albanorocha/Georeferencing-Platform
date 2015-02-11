class CreatePhysicalProfiles < ActiveRecord::Migration
  def change
    create_table :physical_profiles do |t|
      t.integer :cpf

      t.timestamps
    end
  end
end
