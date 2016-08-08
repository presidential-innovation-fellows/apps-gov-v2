class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :description, null: false
      t.string :name, null: false
      t.string :slug, null: false
    end
  end
end
