class AddLogoFingerprintToProduct < ActiveRecord::Migration
  def up
    add_column :products, :logo_fingerprint, :string
  end

  def down
    remove_column :products, :logo_fingerprint
  end
end
