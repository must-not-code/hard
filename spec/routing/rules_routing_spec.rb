require 'rails_helper'

describe 'Routing for Rules' do
  it 'routes "/rules" to rules#index' do
    expect(get: '/rules').to route_to(controller: 'rules', action: 'index')
  end
end
