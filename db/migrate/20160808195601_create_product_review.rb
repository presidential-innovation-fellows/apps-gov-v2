class CreateProductReview < ActiveRecord::Migration
  def change
    create_table :product_reviews do |t|
      t.references :product, null: false
      t.references :review, null: false
      t.string :url
    end
  end
end
