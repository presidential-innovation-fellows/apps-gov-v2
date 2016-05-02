class AddProductRequestsCountToProducts < ActiveRecord::Migration
  def change
    add_column :products, :product_requests_count, :integer, default: 0
  end
end
