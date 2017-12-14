require 'rails_helper'

RSpec.describe Admin::ProjectsController, type: :controller do
  let(:valid_attributes) {
    build(:project).attributes
  }

  before(:each) do
    sign_in(create(:user, is_admin: true))
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new

      expect(response).to have_http_status(:success)
    end

    it "renders the 'new' template" do
      get :new

      expect(response).to render_template('new')
    end

    context 'when current user does not have admin permissions' do
      before(:each) do
        sign_in(create(:user, is_admin: false))
      end

      it 'redirects to the root url' do
        get :new

        expect(response).to redirect_to(root_url)
      end
    end
  end

  describe 'GET #edit' do
    let(:project) { create(:project) }

    it 'returns a success response' do
      get :edit, params: { id: project.id }

      expect(response).to have_http_status(:success)
    end

    it "renders the 'edit' template" do
      get :edit, params: { id: project.id }

      expect(response).to render_template('edit')
    end
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
