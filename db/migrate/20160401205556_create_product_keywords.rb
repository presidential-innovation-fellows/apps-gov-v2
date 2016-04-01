class CreateProductKeywords < ActiveRecord::Migration
  def change
    create_table :product_keywords do |t|
      t.references :keyword, null: false
      t.references :product, null: false
    end
  end
end
