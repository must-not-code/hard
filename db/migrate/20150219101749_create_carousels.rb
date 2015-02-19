class CreateCarousels < ActiveRecord::Migration
  def change
    create_table :carousels do |t|
      t.string :title
      t.string :url
      t.string :image
      t.integer :position
    end
  end
end
