class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.references :agency, index: true, null: false
      t.references :product, index: true, null: false
    end
  end
end
