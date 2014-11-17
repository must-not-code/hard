class Tournament < ActiveRecord::Base
  before_create do
    self.sign_up_end  ||=  self.beginning - 60*60
    self.check_in     ||=  self.beginning - 60*60
    self.check_in_end ||=  self.beginning - 10*60

    tourney = Tournament.last
    if tourney
      self.content    ||=  tourney.content
      self.rules      ||=  tourney.rules
    end
  end

  has_many :users, through: :kinds
  has_many :kinds
  has_many :results
end
