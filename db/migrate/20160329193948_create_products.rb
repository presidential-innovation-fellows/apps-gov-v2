class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.text :long_description, null: false
      t.string :fedramp_inprocess_agency
      t.string :founded_year
      t.string :icon_url
      t.string :linkedin_id
      t.string :location
      t.string :logo_url
      t.string :name, null: false
      t.string :number_of_employees
      t.string :slug, null: false
      t.string :sales_poc
      t.string :short_description, null: false
      t.string :status
      t.string :url, null: false
      t.string :twitter_handle
    end
  end
end
