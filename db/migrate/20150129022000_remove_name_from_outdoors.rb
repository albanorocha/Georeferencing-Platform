class RemoveNameFromOutdoors < ActiveRecord::Migration
  def change
    remove_column :outdoors, :name, :string
  end
end
