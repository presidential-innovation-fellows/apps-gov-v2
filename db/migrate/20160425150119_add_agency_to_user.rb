class AddAgencyToUser < ActiveRecord::Migration
  def change
    add_reference :users, :agency, index: true
  end
end
