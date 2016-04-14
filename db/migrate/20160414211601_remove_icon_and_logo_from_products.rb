class RemoveIconAndLogoFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :icon_url
    remove_column :products, :logo_url
  end
end
