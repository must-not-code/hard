class RenameBannerUrl < ActiveRecord::Migration
  def change
    rename_column :streams, :banner_url, :banner
  end
end
