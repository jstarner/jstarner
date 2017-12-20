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

    context 'when current user does not have admin permissions' do
      before(:each) do
        sign_in(create(:user, is_admin: false))
      end

      it 'redirects to the root url' do
        get :edit, params: { id: project.id }

        expect(response).to redirect_to(root_url)
      end
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

  describe 'POST #create' do
    let(:project) { create(:project) }

    it 'returns a success response' do
      post :create, params: { :project => {title: project.title, image: project.image,  short_desc: project.short_desc, long_desc: project.long_desc, project_link: project.project_link} }

      expect(response).to have_http_status(302)
    end

    it "redirects to 'project' view" do
      post :create, params: { :project => {title: project.title, image: project.image,  short_desc: project.short_desc, long_desc: project.long_desc, project_link: project.project_link} }

      expect(response).to redirect_to('/projects/7')
    end

    context 'when current user does not have admin permissions' do
      before(:each) do
        sign_in(create(:user, is_admin: false))
      end

      it 'redirects to the root url' do
        post :create, params: { :project => {title: project.title, image: project.image,  short_desc: project.short_desc, long_desc: project.long_desc, project_link: project.project_link} }

        expect(response).to redirect_to(root_url)
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:project) { create(:project) }

    it 'returns a success response' do
      delete :destroy, params: {id: project.id}
      expect(response).to have_http_status(302)
    end

    it "redirects to 'projects index' view" do
      delete :destroy, params: {id: project.id}
      expect(response).to redirect_to(projects_url)
    end
  end

  describe 'PATCH #update' do
    let(:project) { create(:project) }

    it 'returns a success response' do
      patch :update, params: {id: project.id, :project => {title: 'testing'}}
      expect(response).to have_http_status(302)
    end

    it 'fails to update database' do
      patch :update, params: {id: project.id, :project => {title: 'testing'}}
      expect(response).to redirect_to(project_url(id: project.id))
    end

    it 'return an error response' do
      patch :update, params: {id: project.id, :project => {title: false}}
      
      expect(response).to have_http_status(302)
    end

    context 'when current user does not have admin permissions' do
      before(:each) do
        sign_in(create(:user, is_admin: false))
      end

      it 'redirects to the root url' do
        patch :create, params: {id: project.id, :project => {title: 'testing'}}
      
        expect(response).to redirect_to(root_url)
      end
    end
  end
end