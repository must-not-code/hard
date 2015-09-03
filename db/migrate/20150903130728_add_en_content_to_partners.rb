class AddEnContentToPartners < ActiveRecord::Migration
  def change
    rename_column :partners, :info, :content_ru
    add_column :partners, :content_en, :text
  end
end
