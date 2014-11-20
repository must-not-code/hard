class FixAvatarsForCarrierWave < ActiveRecord::Migration
  def change
    rename_column :users, :avatar, :old_avatar
    add_column :users, :avatar, :string
  end
end
