require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  before :each do
    @user = create(:user)
    @message = create(:message)
  end

  let(:valid_session) {
    sign_in @user
  }

  describe 'GET messages#index' do
    it "returns an array of messages" do
      valid_session
      create_list(:message, 5)

      get :index

      assert_response :success
      expect(response_json[0]["id"]).to eq(@message.id)
      expect(response_json.length).to eq(6)
    end
  end

  describe 'POST messages#create' do
    it "creates a message" do
      new_message = { from: { email: 'bla@bla.com', name: 'bob bob' }, body: 'asfd' }

      valid_session
      post :create, params: { message: new_message }

      assert_response :success
    end
  end
end
