require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  subject(:user) do 
    User.create!(username: 'Harry Potter', password: '123456')
  end
  describe "GET #new" do
    it "should render the new user template" do
      get :new 
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    let(:params) do {user: {username: "Harry Potter", password: "123456"}}
    end 
    let(:invalid_params) do {user: {username: "Harry Potter", password: "1234"}}
    end
    context "with invalid params" do
      it "should validate the presence of the username and password" do
        post :create, params: invalid_params
        expect(response).to render_template(:new)
        expect(flash[:errors]).to be_present 
      end
    end
    context "with valid params" do
      it "should redirect user to user show page" do
      post :create, params: { user: { username: 'Harry Potter', password: '123456'}}
      end
    end
  end 

  describe "GET #index" do 
    it "should render index input" do
      get :index
      expect(response).to render_template(:index)
    end 
  end 

  describe "GET #show" do
    it "should render show template for matching parmas_id" do 
      get :show, params:{id: user.id}
      expect(response).to render_template(:show)
    end
  end 

end
