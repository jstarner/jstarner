require 'rails_helper'

RSpec.describe Admin::ProjectsController, type: :controller do
  let(:valid_attributes) {
    build(:project).attributes
  }

  before(:each) do
    sign_in(create(:user, is_admin: true))
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index

      expect(response).to have_http_status(:success)
    end

    it "renders the 'index' template" do
      get :index

      expect(response).to render_template('index')
    end
  end
end
