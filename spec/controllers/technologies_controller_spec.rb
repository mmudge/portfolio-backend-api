require 'rails_helper'

RSpec.describe TechnologiesController, type: :controller do
  before :each do
    @user = create(:user)
    @technology = create(:technology, projects: [create(:project)])
  end

  let(:valid_session) {
    sign_in @user
  }

  describe 'GET technologies#index' do
    it "returns an array of technologies" do
      create_list(:technology, 5)

      get :index

      assert_response :success
      expect(response_json[0]["id"]).to eq(@technology.id)
      expect(response_json.length).to eq(6)
    end
  end

  describe 'POST technologies#create' do
    context "if a user does not have a valid session" do
      it "refuses to create a technology and throws an unauthorized error" do
        new_technology = { name: 'new tech' }
        post :create, params: { technology: new_technology }

        assert_response :unauthorized
        expect(@response.body).to match(/You need to sign in or sign up before continuing./)
      end
    end

    context 'if a user has a valid session' do
      it "creates a technology" do
        new_technology = { title: 'new technology' }

        valid_session
        post :create, params: { technology: new_technology }

        assert_response :success
        expect(response_json["name"]).to eq(new_technology[:name])
      end
    end
  end

  describe "PUT technologies#update" do
    context "if a user does not have a valid session" do
      it "refuses to update the technology and throws an unauthorized error" do
        post :create, params: { id: @technology.id,  technology: { name: 'bla' } }

        assert_response :unauthorized
        expect(@response.body).to match(/You need to sign in or sign up before continuing./)
      end
    end

    context "if a user has a valid session" do
      it "updates the project" do
        valid_session
        post :create, params: { id: @technology.id, technology: { name: 'bla' } }

        assert_response :success
        expect(response_json["name"]).to eq('bla')
      end
    end
  end

  describe "DELETE technologies#destroy" do
    context "if a user does not have a valid session" do
      it "refuses to delete the technology and throws unauthorized error" do
        delete :destroy, params: { id: @technology.id }
        assert_response :unauthorized
        expect(@response.body).to eq('You need to sign in or sign up before continuing.')
      end
    end

    context "if a user has a valid session" do
      it "deletes the technology" do
        technologies_count = Technology.all.count
        valid_session

        delete :destroy, params: { id: @technology.id }
        assert_response :success
        expect(Technology.all.count).to eq(technologies_count - 1)
      end
    end
  end
end
