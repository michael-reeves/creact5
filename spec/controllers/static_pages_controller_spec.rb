require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  describe 'GET index' do
    it 'renders the index template' do
      get :index

      expect(response).to have_http_status :success
    end
  end


end
