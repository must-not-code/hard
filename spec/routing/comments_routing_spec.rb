require 'rails_helper'

describe 'Routing for Comments' do
  it 'routes "/comments" to comments#create' do
    expect(post: '/comments').to route_to(controller: 'comments', action: 'create')
  end

  it 'routes "/comments/:id" to comments#destroy' do
    expect(delete: '/comments/123').to route_to(controller: 'comments', action: 'destroy', id: '123')
  end
end
