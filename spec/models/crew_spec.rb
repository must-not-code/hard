require 'rails_helper'

describe Crew do
  it { should have_many(:members) }
end
