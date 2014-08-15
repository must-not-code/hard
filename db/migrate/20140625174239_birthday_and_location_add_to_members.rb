class BirthdayAndLocationAddToMembers < ActiveRecord::Migration
  change_table :members do |t|
    t.date :birthday
    t.string :location
  end
end
