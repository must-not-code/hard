require 'rails_helper'

describe 'Routing for Streams' do
  it 'routes "/streams" to streams#index' do
    expect(get: '/streams').to route_to(controller: 'streams', action: 'index')
  end

  it 'routes "/streams/:id" to streams#show' do
    expect(get: '/streams/jopa').to route_to(controller: 'streams', action: 'show', id: 'jopa')
  end
end
