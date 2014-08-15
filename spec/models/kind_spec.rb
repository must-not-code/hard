require 'rails_helper'

describe Kind do
  it { should belong_to(:user) }
  it { should belong_to(:tournament) }
end
