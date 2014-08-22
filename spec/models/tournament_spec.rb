require 'rails_helper'

describe Tournament do
  it { should have_many(:users).through(:kinds) }
  it { should have_many(:kinds) }
  it { should have_many(:results) }

  it 'is set default time limits' do
    tournament = FactoryGirl.create(:tournament)
    expect(tournament.sign_up_end).to eq(tournament.beginning - 60*60)
    expect(tournament.check_in).to eq(tournament.beginning - 60*60)
    expect(tournament.check_in_end).to eq(tournament.beginning - 10*60)
  end
end
