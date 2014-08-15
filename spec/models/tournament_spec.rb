require 'rails_helper'

describe Tournament do
  it { should have_many(:users).through(:kinds) }
  it { should have_many(:kinds) }
  it { should have_many(:results) }
end
