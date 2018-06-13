require 'rails_helper'

describe FoodsController do
  describe 'GET new' do
    it 'redirects to login page if not logged in'
    get :new
    expect(response).to redirect_to(new_user_session_url)
  end
end