class CreateGovtEmployee < ActiveRecord::Migration
  def change
    create_table :govt_employees do |t|
      t.references :user, index: true, null: false
    end
  end
end
