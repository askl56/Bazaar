require 'rails_helper'

describe Api::V1::UsersController, type: :controller do
  before(:each) { request.headers['Accept'] = "application/vnd.bazaar.v1, #{Mime::JSON}" }
  before(:each) { request.headers['Content-Type'] = Mime::JSON.to_s }

  describe "GET #SHOW" do
    before(:each) do
      @user = FactoryGirl.create :user
      get :show, id: @user.id
    end

    it "returns the information about a reporter on a hash" do
      user_response = json_response
      expect(user_response[:email]).to eql @user.email
    end

    it { should respond_with 200 }
  end

  describe "POST #CREATE" do
    context "when user is successfully created" do
      before(:each) do
        @user_attributes = FactoryGirl.attributes_for :user
        post :create, { user: @user_attributes }
      end

      it "renders the json representation for the user record" do
        user_response = json_response
        expect(user_response[:email]).to eql @user_attributes[:email]
      end

      it { should respond_with 201 }
    end

    context "when user is not created" do
      before(:each) do
        @invalid_user_attributes = { password: "12345678",
                                     password_confirmation: "12345678"}
        post :create, { user: @invalid_user_attributes }
      end

      it "renders an error json" do
        user_response = json_response
        expect(user_response).to have_key(:errors)
      end

      it "renders the json errors with reasons" do
        user_response = json_response
        expect(user_response[:errors][:email]).to include "can't be blank"
      end

      it { should respond_with 422 }
    end
  end

  describe "PUT/PATCH #update" do

    context "when is successfully updated" do
      before(:each) do
        @user = FactoryGirl.create :user
        patch :update, { id: @user.id,
          user: { email: "newmail@example.com" } }
      end

      it "renders the json for the updated user" do
        user_response = json_response
        expect(user_response[:email]).to eql "newmail@example.com"
      end
      it { should respond_with 200 }
    end

    context "when is not updated" do
      before(:each) do
        @user = FactoryGirl.create :user
        patch :update, { id: @user.id,
          user: { email: "bademail.com" } }
      end

      it "renders json errors" do
        user_response = json_response
        expect(user_response).to have_key(:errors)
      end

      it "renders the errors on why the user was not created" do
        user_response = json_response
        expect(user_response[:errors][:email]).to include "is invalid"
      end

      it { should respond_with 422}
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      @user = FactoryGirl.create :user
      delete :destroy, { id: @user.id }
    end

    it { should respond_with 204 }
  end
end
