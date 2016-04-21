class CreateProductCategories < ActiveRecord::Migration
  def change
    create_table :product_categories do |t|
      t.references :category, index: true, null: false
      t.references :product, index: true, null: false
    end
  end
end
