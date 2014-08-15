class Tournament < ActiveRecord::Base
  before_create  :set_default_time

  private
    def set_default_time
      self.sign_up_end  ||=  self.beginning - 60*60
      self.check_in     ||=  self.beginning - 60*60
      self.check_in_end ||=  self.beginning - 10*60
    end

  has_many :users, through: :kinds
  has_many :kinds
  has_many :results
end
