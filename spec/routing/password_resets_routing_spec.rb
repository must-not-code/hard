require 'rails_helper'

describe 'Routing for Password Resets' do
  it 'routes "/password_resets" to password_resets#create' do
    expect(post: '/password_resets').to route_to(controller: 'password_resets', action: 'create')
  end

  it 'routes "/password_resets/:id/edit" to password_resets#edit' do
    expect(get: '/password_resets/123/edit').to route_to(controller: 'password_resets', action: 'edit', id: '123')
  end

  it 'routes "/password_resets/:id" to password_resets#update' do
    expect(put: '/password_resets/123').to route_to(controller: 'password_resets', action: 'update', id: '123')
  end

  it 'routes "/password_resets" to password_resets#new' do
    expect(get: '/password_resets').to route_to(controller: 'password_resets', action: 'new')
  end
end
