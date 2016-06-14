class AddTrashedAtToProductRequest < ActiveRecord::Migration
  def change
    add_column :product_requests, :trashed_at, :timestamp
  end
end
