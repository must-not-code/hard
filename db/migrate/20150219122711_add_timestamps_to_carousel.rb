class AddTimestampsToCarousel < ActiveRecord::Migration
  def change
    add_column :carousels, :created_at, :datetime
    add_column :carousels, :updated_at, :datetime
  end
end
