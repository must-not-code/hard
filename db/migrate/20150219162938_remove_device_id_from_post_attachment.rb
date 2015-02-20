class RemoveDeviceIdFromPostAttachment < ActiveRecord::Migration
  def change
    remove_column :post_attachments, :post_id, :integer
  end
end
