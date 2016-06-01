class CreateAtoStatuses < ActiveRecord::Migration
  def change
    create_table :ato_statuses do |t|
      t.boolean :pending, default: false, null: false
      t.references :ato_type, index: true, null: false
      t.references :product, index: true, null: false
      t.string :url
    end
  end
end
