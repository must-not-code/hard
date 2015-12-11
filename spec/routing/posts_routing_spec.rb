require 'rails_helper'

describe 'Routing for Posts' do
  it 'routes "/posts" to posts#index' do
    expect(get: '/posts').to route_to(controller: 'posts', action: 'index')
  end

  it 'routes "/posts/:id" to posts#show' do
    expect(get: '/posts/123').to route_to(controller: 'posts', action: 'show', id: '123')
  end
end
