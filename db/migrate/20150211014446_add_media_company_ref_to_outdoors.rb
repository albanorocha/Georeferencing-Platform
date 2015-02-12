class AddMediaCompanyRefToOutdoors < ActiveRecord::Migration
  def change
    add_reference :outdoors, :media_company, index: true
  end
end
