class AddSlugToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :slug, :string, null: false
  end
end
