require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #index" do
    it "renders the users index" do
      get :index
      expect(response).to be_success
      expect(response).to render_template(:index)
    end
  end
  
  describe "GET #show" do
    it "renders the user name and balance" do
      User.create!(username: "Baki", balance: 10000)
      get :show, id: 1
      expect(response).to render_template(:show)
    end

    context "if the user does not exist" do
      it "is not a success" do
        begin
          get :show, id: -1
        rescue
          ActiveRecord::RecordNotFound
        end

        expect(response).not_to render_template(:show)
      end
    end
  end
  
  describe "POST #create" do
    context "with invalid params" do
      it "renders new template" do
        post :create, user: {username: "Dio"}
        expect(response).to render_template(:new)
      end
    end

    context "with valid params" do
      it "redirects to user show page" do
        post :create, user: {username: "Dio", balance: 100}
        expect(response).to redirect_to(user_url(User.find_by(username: "Dio")))
      end
    end
  end
  
  describe "PATCH #update" do
    context "with invalid params" do
      it "redirects to user show page" do
        post :create, user: {username: "Dio", balance: -100}
        expect(response).to redirect_to(user_url(User.find_by(username: "Dio")))
      end
    end

    context "with valid params" do
      it "redirects to user show page" do
        post :create, user: {username: "Dio", balance: 100}
        expect(response).to redirect_to(user_url(User.find_by(username: "Dio")))
      end
    end
  end
  
end
