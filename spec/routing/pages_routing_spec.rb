require 'rails_helper'

describe 'Routing for Pages' do
  it 'routes "/about" to pages#about' do
    expect(get: '/about').to route_to(controller: 'pages', action: 'about')
  end
end
