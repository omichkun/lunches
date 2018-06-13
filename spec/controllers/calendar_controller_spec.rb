require 'rails_helper'

describe FoodsController do

  describe 'unauthenticated user' do
    describe 'GET index' do
      it 'redirects to login page if not logged in' do
        get :index
        expect(response).to redirect_to(new_user_session_url)
      end
    end


  end



  describe 'authenticated user' do
    let(:user) {FactoryBot.create(:user)}
    before do
       sign_in(user)
    end


    describe 'GET index' do
      it "renders :index template" do
        get :index
        expect(response).to render_template(:index)
      end
    end


  end
end