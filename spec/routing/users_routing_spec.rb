require 'spec_helper'

describe 'Routing for Users' do
  it 'routes "/signup" to users#new' do
    expect(get: '/signup').to route_to(controller: 'users', action: 'new')
  end

  it 'routes "/users" to users#create' do
    expect(post: '/users').to route_to(controller: 'users', action: 'create')
  end

  it 'routes "/users/:id/activate" to users#activate' do
    expect(get: '/users/ZW9vwDcdVq4D4mXSLDZS/activate').to route_to(controller: 'users', action: 'activate', id: 'ZW9vwDcdVq4D4mXSLDZS')
  end

  it 'routes "/users/:id" to users#show' do
    expect(get: '/users/admin').to route_to(controller: 'users', action: 'show', id: 'admin')
  end

  it 'routes "/users/:id/edit" to users#edit' do
    expect(get: '/users/admin/edit').to route_to(controller: 'users', action: 'edit', id: 'admin')
  end

  it 'routes "/users/:id" to users#update' do
    expect(put: '/users/admin').to route_to(controller: 'users', action: 'update', id: 'admin')
  end

  it 'routes "/users/:id/password" to users#change_password' do
    expect(get: '/users/jopen/password').to route_to(controller: 'users', action: 'change_password', id: 'jopen')
  end

  it 'routes "/users/:id/password" to users#update_password' do
    expect(put: '/users/jopen/password').to route_to(controller: 'users', action: 'update_password', id: 'jopen')
  end
end
