require 'rails_helper'

class Authentication
  include Authenticable

  def request
  end

  def render(_args)
  end
end

describe Authenticable do
  let(:authentication) { Authentication.new }
  subject { authentication }

  describe '#current_user' do
    before do
      @user = FactoryGirl.create :user
      request.headers['Authorization'] = @user.auth_token
      authentication.stub(:request).and_return(request)
    end
    it 'returns the user from the authorization header' do
      expect(authentication.current_user.auth_token).to eql @user.auth_token
    end
  end

  describe '#authenticate_with_token' do
    before do
      @user = FactoryGirl.create :user
      authentication.stub(:current_user).and_return(nil)
    end

    it 'render a json error message' do
      expect(authentication).to receive(:render).with(json: { errors: 'Not authenticated' }, status: :unauthorized)
      authentication.authenticate_with_token!
    end
  end

  describe '#user_signed_in?' do
    context "when there is a user on 'session'" do
      before do
        @user = FactoryGirl.create :user
        authentication.stub(:current_user).and_return(@user)
      end

      it { should be_user_signed_in }
    end

    context "when there is no user on 'session'" do
      before do
        @user = FactoryGirl.create :user
        authentication.stub(:current_user).and_return(nil)
      end

      it { should_not be_user_signed_in }
    end
  end
end
