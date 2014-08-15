require 'rails_helper'

describe 'Routing for Sessions' do
  it 'routes "/login" to sessions#new' do
    expect(get: '/login').to route_to(controller: 'sessions', action: 'new')
  end

  it 'routes "/login" to sessions#create' do
    expect(post: '/login').to route_to(controller: 'sessions', action: 'create')
  end

  it 'routes "/logout" to sessions#destroy' do
    expect(get: '/logout').to route_to(controller: 'sessions', action: 'destroy')
  end
end
