class AddDraftAttributesToProductRequest < ActiveRecord::Migration
  def change
    add_column :product_requests, :draft_id, :integer
    add_column :product_requests, :published_at, :timestamp
  end
end
