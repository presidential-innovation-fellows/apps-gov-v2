class AddObjectChangesToDrafts < ActiveRecord::Migration
  def change
    add_column :drafts, :object_changes, :json
  end
end
