require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  before :each do
    @user_one = User.create!(email: 'tester@test.com', password: 'asdfasdf', password_confirmation: 'asdfasdf')

  end

  describe 'GET posts#index' do
    it "returns posts" do
      expect(@user_one).to be_valid
    end
  end


end
