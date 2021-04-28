require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "should render the new user template" do
      get :new 
      expect(response).to render_template("new")
    end
  end

  describe "POST #create" do
    let(:params) do {user: {username: "Harry Potter", password: "123456"}}
    end 
    let(:invalid_params) do {user: {username: "Harry Potter", password: "1234"}}
    end
    context "with invalid params" do
      it "should validate the presence of the username and password" do
        post :create, invalid_params: { user: { username: 'Harry Potter', password: '1234'}} do
          expect(response).to render_template("new")
        end
      end
    end
    context "with valid params" do
      it "should redirect user to user show page" do
      post :create, params: { user: { username: 'Harry Potter', password: '123456'}}
      end
    end
  end 
end
