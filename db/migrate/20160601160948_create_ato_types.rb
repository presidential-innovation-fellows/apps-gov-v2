class CreateAtoTypes < ActiveRecord::Migration
  def change
    create_table :ato_types do |t|
      t.string :name, null: false
      t.string :slug, null: false, unique: true
      t.text :description
    end
  end
end
