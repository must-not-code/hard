require 'rails_helper'

describe 'Routing for Crews' do
  #it 'routes "/crews" to crews#index' do
  #  expect(get: '/crews').to route_to(controller: 'crews', action: 'index')
  #end

  it 'routes "/crews/:game" to crews#show' do
    expect(get: '/crews/dota2').to route_to(controller: 'crews', action: 'show', game: 'dota2')
  end
end
