require 'rails_helper'

describe Result do
  it { should belong_to(:user) }
  it { should belong_to(:tournament) }
end
