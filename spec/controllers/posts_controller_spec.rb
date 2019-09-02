require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  before :each do
    @user = create(:user)
    @post = create(:post, user_id: @user.id)
  end

  let(:valid_session) {
    sign_in @user
  }

  describe 'GET posts#index' do
    it "returns posts" do
      get :index

      assert_response :success
      expect(Post.all).to include(@post)
      expect(Post.all.length).to eq(1)
    end
  end

  describe 'GET posts#show' do
    it "return the requested post" do
      get :show, params: { id: @post.id }

      assert_response :success

      expect(response_json["title"]).to eq(@post["title"])
    end
  end

  describe 'POST post#create' do
    context "if a user does not have a valid session" do
      it "refuses to create post and throws unauthorized error" do
        new_post = { title: 'new post', user_id: @user.id}
        post :create, params: { post: new_post }

        assert_response :unauthorized
        expect(@response.body).to eq('You need to sign in or sign up before continuing.')
      end
    end


    context 'if a user has a valid session' do
      it "creates a post" do
        valid_session

        new_post = { title: 'new post', user_id: @user.id}
        # new_post = build(:post, user_id: @user.id)
        post :create, params: { post: new_post }

        assert_response :success
        expect(response_json["title"]).to eq(new_post[:title])
      end
    end
  end

  describe "DELETE posts#destroy" do
    context "if a user does not have a valid session" do
      it "refuses to delete post and throws unauthorized error" do
        delete :destroy, params: { id: @post.id }
        assert_response :unauthorized
        expect(@response.body).to eq('You need to sign in or sign up before continuing.')
      end
    end

    context "if a user has a valid session AND current user is author of post" do
      it "deletes the post" do
        valid_session

        delete :destroy, params: { id: @post.id }
        assert_response :success
        expect(Post.all.length).to eq(0)
      end
    end
  end
end
