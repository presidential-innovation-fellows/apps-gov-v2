class RenameProductCategoriesToProductSubcategories < ActiveRecord::Migration
  def self.up
    remove_reference :product_categories, :category
    rename_table :product_categories, :product_subcategories
    add_reference :product_subcategories, :subcategory, index: true
  end

  def self.down
    remove_reference :product_subcategories, :subcategory
    rename_table :product_subcategories, :product_categories
    add_reference :product_categories, :category, index: true
  end
end
