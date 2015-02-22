class AddFieldsToOutdoors < ActiveRecord::Migration
  def change
    add_column :outdoors, :company, :string
    add_column :outdoors, :price, :decimal
    add_column :outdoors, :avaliable, :boolean, default: true
  end
end
