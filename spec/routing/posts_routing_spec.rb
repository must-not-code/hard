require 'rails_helper'

describe 'Routing for Posts' do
  it 'routes "/" to posts#index' do
    expect(get: '/').to route_to(controller: 'posts', action: 'index')
  end

  it 'routes "/posts/new" to posts#new' do
    expect(get: '/posts/new').to route_to(controller: 'posts', action: 'new')
  end

  it 'routes "/posts/:id" to posts#show' do
    expect(get: '/posts/123').to route_to(controller: 'posts', action: 'show', id: '123')
  end

  it 'routes "/posts/:id/edit" to posts#edit' do
    expect(get: '/posts/123/edit').to route_to(controller: 'posts', action: 'edit', id: '123')
  end

  it 'routes "/posts/save" to posts#save' do
    expect(post: '/posts/save').to route_to(controller: 'posts', action: 'save')
  end

  it 'routes "/posts/upload" to posts#upload' do
    expect(post: '/posts/upload').to route_to(controller: 'posts', action: 'upload')
  end

  it 'routes "/posts/:id/approve" to posts#approve' do
    expect(post: '/posts/123/approve').to route_to(controller: 'posts', action: 'approve', id: '123')
  end
end
