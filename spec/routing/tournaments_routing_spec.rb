require 'rails_helper'

describe 'Routing for Tournaments' do
  it 'routes "/tournaments" to tournaments#index' do
    expect(get: '/tournaments').to route_to(controller: 'tournaments', action: 'index')
  end

  it 'routes "/tournaments/:id" to tournaments#show' do
    expect(get: '/tournaments/123').to route_to(controller: 'tournaments', action: 'show', id: '123')
  end

  it 'routes "/tournaments/:id/list" to tournaments#list' do
    expect(get: '/tournaments/123/list').to route_to(controller: 'tournaments', action: 'list', id: '123')
  end

  it 'routes "/tournaments/:id/bracket" to tournaments#bracket' do
    expect(get: '/tournaments/123/bracket').to route_to(controller: 'tournaments', action: 'bracket', id: '123')
  end

  it 'routes "/tournaments/:id/results" to tournaments#results' do
    expect(get: '/tournaments/123/results').to route_to(controller: 'tournaments', action: 'results', id: '123')
  end

  it 'routes "/tournaments/:id/signup" to tournaments#signup' do
    expect(post: '/tournaments/123/signup').to route_to(controller: 'tournaments', action: 'signup', id: '123')
  end

  it 'routes "/tournaments/:id/signout" to tournaments#signout' do
    expect(post: '/tournaments/123/signout').to route_to(controller: 'tournaments', action: 'signout', id: '123')
  end

  it 'routes "/tournaments/:id/checkin" to tournaments#checkin' do
    expect(post: '/tournaments/123/checkin').to route_to(controller: 'tournaments', action: 'checkin', id: '123')
  end

  it 'routes "/tournaments/:id/standings" to tournaments#standings' do
    expect(post: '/tournaments/123/standings').to route_to(controller: 'tournaments', action: 'standings', id: '123')
  end

  it 'routes "/tournaments/:id/standings" to tournaments#grid' do
    expect(get: '/tournaments/123/standings').to route_to(controller: 'tournaments', action: 'grid', id: '123')
  end

  it 'routes "/tournaments/:id/shuffle" to tournaments#shuffle' do
    expect(post: '/tournaments/123/shuffle').to route_to(controller: 'tournaments', action: 'shuffle', id: '123')
  end
end
