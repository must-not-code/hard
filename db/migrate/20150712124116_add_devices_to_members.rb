class AddDevicesToMembers < ActiveRecord::Migration
  def change
    add_column :members, :mouse, :string
    add_column :members, :keyboard, :string
    add_column :members, :headset, :string
    add_column :members, :pad, :string
  end
end
