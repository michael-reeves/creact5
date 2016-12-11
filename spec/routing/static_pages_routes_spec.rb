require 'rails_helper'

describe 'root_path routes', type: :routing do
  describe 'GET /' do
    it 'renders static_pages#index' do
      expect(get: root_path).to route_to( controller: 'static_pages', action: 'index')
    end
  end
end
