class CreateSubcategories < ActiveRecord::Migration
  def change
    create_table :subcategories do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.references :category, null: false
    end
  end
end
