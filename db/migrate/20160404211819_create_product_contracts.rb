class CreateProductContracts < ActiveRecord::Migration
  def change
    create_table :product_contracts do |t|
      t.references :contract, index: true, null: false
      t.references :product, index: true, null: false
    end
  end
end
