class AddImageToOutdoors < ActiveRecord::Migration
  def change
    add_column :outdoors, :image, :string
  end
end
