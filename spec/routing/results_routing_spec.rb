require 'rails_helper'

describe 'Routing for Results' do
  it 'routes "/results" to results#create' do
    expect(post: '/results').to route_to(controller: 'results', action: 'create')
  end
end
