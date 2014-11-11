require 'rails_helper'

describe 'Routing for Videos' do
  it 'routes "/videos" to videos#index' do
    expect(get: '/videos').to route_to(controller: 'videos', action: 'index')
  end

  it 'routes "/videos/:id" to videos#show' do
    expect(get: '/videos/MtQZ0KNv8GU').to route_to(controller: 'videos', action: 'show', id: 'MtQZ0KNv8GU')
  end
end
