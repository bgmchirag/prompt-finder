# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Routes', type: :routing do
  it 'routes GET /up to rails/health#show' do
    expect(get: '/up').to route_to('rails/health#show')
  end

  it 'routes GET / to datasets#index' do
    expect(get: '/').to route_to('datasets#index')
  end

  it 'routes GET /datasets to datasets#index' do
    expect(get: '/datasets').to route_to('datasets#index')
  end

  it 'does not route POST /datasets' do
    expect(post: '/datasets').not_to be_routable
  end

  it 'does not route PUT /datasets/:id' do
    expect(put: '/datasets/1').not_to be_routable
  end

  it 'does not route DELETE /datasets/:id' do
    expect(delete: '/datasets/1').not_to be_routable
  end
end
