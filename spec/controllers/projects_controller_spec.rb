require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  before :each do
    @user = create(:user)
    @project = create(:project)
  end

  let(:valid_session) {
    sign_in @user
  }

  describe 'GET projects#index' do
    it "returns an array of projects" do
      create_list(:project, 5)

      get :index

      assert_response :success
      expect(response_json[0]["id"]).to eq(@project.id)
      expect(response_json.length).to eq(6)
    end
  end

  describe 'GET projects#show' do
    it "return the requested post" do
      get :show, params: { id: @project.id }

      assert_response :success

      expect(response_json["id"]).to eq(@project.id)
      expect(response_json["title"]).to eq(@project.title)
    end
  end

  describe 'POST projects#create' do
    context "if a user does not have a valid session" do
      it "refuses to create a project and throws an unauthorized error" do
        new_project = { title: 'new project' }
        post :create, params: { project: new_project }

        assert_response :unauthorized
        expect(@response.body).to match(/You need to sign in or sign up before continuing./)
      end
    end

    context 'if a user has a valid session' do
      it "creates a project" do
        new_project = { title: 'new project' }

        valid_session
        post :create, params: { project: new_project }

        assert_response :success
        expect(response_json["title"]).to eq(new_project[:title])
      end
    end
  end

  describe 'PUT projects#update' do
    context "if a user does not have a valid session" do
      it "refuses to update the project and throws an unauthorized error" do
        post :create, params: { id: @project.id,  project: { title: 'bla' } }

        assert_response :unauthorized
        expect(@response.body).to match(/You need to sign in or sign up before continuing./)
      end
    end

    context 'if a user has a valid session' do
      it "updates the project" do
        valid_session
        post :create, params: { id: @project.id, project: { title: 'bla' } }

        assert_response :success
        expect(response_json["title"]).to eq('bla')
      end
    end
  end

  describe "DELETE projects#destroy" do
    context "if a user does not have a valid session" do
      it "refuses to delete the project and throws unauthorized error" do
        delete :destroy, params: { id: @project.id }
        assert_response :unauthorized
        expect(@response.body).to eq('You need to sign in or sign up before continuing.')
      end
    end

    context "if a user has a valid session" do
      it "deletes the project" do
        projects_count = Project.all.count
        valid_session

        delete :destroy, params: { id: @project.id }
        assert_response :success
        expect(Project.all.count).to eq(projects_count - 1)
      end
    end
  end
end
