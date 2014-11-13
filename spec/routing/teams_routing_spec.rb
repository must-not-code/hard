require 'rails_helper'

describe 'Routing for Teams' do
  #it 'routes "/teams" to teams#index' do
  #  expect(get: '/teams').to route_to(controller: 'teams', action: 'index')
  #end

  it 'routes "/teams/:game" to teams#show' do
    expect(get: '/teams/dota2').to route_to(controller: 'teams', action: 'show', game: 'dota2')
  end
end
