class AddPreviewAndViewsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :preview, :string
    add_column :posts, :views, :integer, default: 0
  end
end
