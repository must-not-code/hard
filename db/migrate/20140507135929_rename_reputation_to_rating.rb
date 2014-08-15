class RenameReputationToRating < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.rename :reputation, :rating
    end
  end
end
