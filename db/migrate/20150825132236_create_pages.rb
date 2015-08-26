class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.text :content_ru
      t.text :content_en
    end
  end
end
