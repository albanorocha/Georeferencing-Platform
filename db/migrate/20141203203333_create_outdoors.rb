class CreateOutdoors < ActiveRecord::Migration
  def change
    create_table :outdoors do |t|
      t.string :name
      t.string :code
      t.text :description
      t.string :address

      t.timestamps
    end
  end
end
