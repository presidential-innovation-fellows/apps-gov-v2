module Registration
  class GovernmentEmployeesController < ApplicationController
    def new
      @govt_employee = GovtEmployee.new
      @contract_officer = ContractOfficer.new
    end
  end
end
