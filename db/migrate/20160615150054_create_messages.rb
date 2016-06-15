class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.belongs_to :author, null: false
      t.text :content, null: false
    end
  end
end
