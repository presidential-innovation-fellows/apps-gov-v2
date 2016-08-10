class AddOfficersToProductRequests < ActiveRecord::Migration
  def change
    add_column :product_requests, :contract_officer_email, :string
    add_column :product_requests, :authorizing_official_email, :string
  end
end
