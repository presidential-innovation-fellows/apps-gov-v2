class CreateProductRequest < ActiveRecord::Migration
  def change
    create_table :product_requests do |t|
      t.references :product, :user, index: true, null: false, unique: true
    end
  end
end
