require 'rails_helper'

describe Member do
  it { should belong_to(:team) }
end
