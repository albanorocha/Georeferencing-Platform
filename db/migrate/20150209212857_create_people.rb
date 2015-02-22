class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :telephone
      t.references :profile, polymorphic: true, index: true

      t.timestamps
    end
  end
end
