class CreateContractOfficer < ActiveRecord::Migration
  def change
    create_table :contract_officers do |t|
      t.references :agency, index: true, null: false
      t.references :user, index: true, null: false
    end
  end
end
