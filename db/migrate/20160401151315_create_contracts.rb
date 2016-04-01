class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.string :contact_email
      t.string :name, null: false
      t.string :slug, null: false
      t.text :description, null: false
      t.text :steps
      t.timestamps
    end
  end
end
