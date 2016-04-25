class RemoveGovtEmployeeAndContractOfficer < ActiveRecord::Migration
  def change
    drop_table :contract_officers
    drop_table :govt_employees
  end
end
