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

  it 'routes "/users/:username" to users#show' do
    expect(get: '/users/admin').to route_to(controller: 'users', action: 'show', username: 'admin')
  end

  it 'routes "/users/:username/edit" to users#edit' do
    expect(get: '/users/admin/edit').to route_to(controller: 'users', action: 'edit', username: 'admin')
  end

  it 'routes "/users/:username" to users#update' do
    expect(put: '/users/admin').to route_to(controller: 'users', action: 'update', username: 'admin')
  end

  it 'routes "/users/:username" to users#avatar' do
    expect(post: '/users/admin/avatar').to route_to(controller: 'users', action: 'avatar', username: 'admin')
  end

  it 'routes "/change_password" to users#change_password' do
    expect(get: '/change_password').to route_to(controller: 'users', action: 'change_password')
  end

  it 'routes "/change_password" to users#update_password' do
    expect(put: '/change_password').to route_to(controller: 'users', action: 'update_password')
  end
end
