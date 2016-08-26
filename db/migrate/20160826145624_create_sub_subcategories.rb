class CreateSubSubcategories < ActiveRecord::Migration[5.0]
  def self.up
    create_table :sub_subcategories do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.references :subcategory, index: true
    end

    remove_reference :product_subcategories, :subcategory
    rename_table :product_subcategories, :product_sub_subcategories
    add_reference :product_sub_subcategories, :sub_subcategory, index: true
  end

  def self.down
    remove_reference :product_sub_subcategories, :sub_subcategory
    rename_table :product_sub_subcategories, :product_subcategories
    add_reference :product_subcategories, :subcategory, index: true

    drop_table :sub_subcategories
  end
end
