class AddPersonReferencesToUser < ActiveRecord::Migration
  def change
    add_reference :users, :person, index: true
  end
end
