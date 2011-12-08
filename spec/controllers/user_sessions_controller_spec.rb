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
			post :create, {:login => "test", :password => "test123"}
			assigns(:user_session).login.should eq @user.login
		end

	end

pending 'test de la destruction de session'
#	describe "DELETE /user_sessions/:id" do

#		it "detruit une session" do
#			UserSession.should_receive(:destroy)
##			@user_session = stub_model(UserSession, :login => 'test', :password => 'test123')
##			@user_session.stub(:find) {@user_session}
#			post :create, {:login => "test", :password => "test123"}
##			UserSession.create(:login => "test", :password => "test123")
#			delete :destroy
#			assigns(:user_session).should be_nil
#		end
#	end

end
