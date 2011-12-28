require 'spec_helper'
include Authlogic::TestCase

describe UserSessionsController do

	before(:each) do
		activate_authlogic
		@user = stub_model(User, :login => "test", :password => "test123", :password_confirmation => "test123")
  	controller.stub!(:current_user).and_return nil
	end

	describe "POST /user_sessions" do
		
		it "cree une session" do
			assigns(:user_session).should be_nil
			post :create, {:login => "test", :password => "test123"}
			assigns(:user_session).login.should eq @user.login
		end

	end

pending "Test delete user_session"
#	describe "DELETE /user_sessions/:id" do

#		it "detruit une session" do
#			post :create, {:login => "test", :password => "test123"}
#			assigns(:user_session).login.should eq @user.login
#			delete :destroy
#			assigns(:user_session).should be_nil
#		end
#	end

end
