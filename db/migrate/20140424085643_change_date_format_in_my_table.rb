class ChangeDateFormatInMyTable < ActiveRecord::Migration
  change_table :tournaments do |t|
    t.remove :date
    t.datetime :beginning
    t.datetime :sign_up_end
    t.datetime :check_in
    t.datetime :check_in_end
  end
end
