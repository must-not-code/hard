class AddCountries < ActiveRecord::Migration
  def change
    add_column :users, :country, :string
    add_column :users, :city, :string
    add_column :teams, :country, :string
    add_column :members, :country, :string
    add_column :members, :city, :string
    remove_column :members, :location
  end
end
