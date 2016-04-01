class CreateAgencies < ActiveRecord::Migration
  def change
    create_table :agencies do |t|
      t.string :code, null: false
      t.string :name, null: false
    end
  end
end
