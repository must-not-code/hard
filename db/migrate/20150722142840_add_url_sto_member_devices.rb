class AddUrlStoMemberDevices < ActiveRecord::Migration
  def change
    add_column :members, :mouse_link, :string
    add_column :members, :keyboard_link, :string
    add_column :members, :headset_link, :string
    add_column :members, :pad_link, :string
  end
end
