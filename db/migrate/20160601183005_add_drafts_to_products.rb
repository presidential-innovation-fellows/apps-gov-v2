class AddDraftsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :draft_id, :integer
    add_column :products, :published_at, :timestamp
  end
end
