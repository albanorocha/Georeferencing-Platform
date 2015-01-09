class AddLatitudeLongitudeToOutdoors < ActiveRecord::Migration
  def change
    add_column :outdoors, :latitude, :float
    add_column :outdoors, :longitude, :float
  end
end
