require 'rails_helper'

RSpec.describe 'HomeControllers', type: :request do
  describe 'GET root path' do
    it 'returns the root path' do
      get root_path
      expect(response).to have_http_status(:ok)
    end
  end
end
