class AddRejectedToDraft < ActiveRecord::Migration
  def change
    add_column :drafts, :rejected, :boolean, default: false, null: false
  end
end
