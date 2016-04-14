class AddLogoAttachmentToProduct < ActiveRecord::Migration
  def up
    add_attachment :products, :logo
  end

  def down
    remove_attachment :products, :logo
  end
end
