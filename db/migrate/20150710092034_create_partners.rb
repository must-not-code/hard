class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.string :title
      t.string :logo
      t.text :info
      t.string :site
      t.string :site_icon
      t.string :vk
      t.string :fb
      t.string :instagram
      t.timestamps
    end
  end
end
