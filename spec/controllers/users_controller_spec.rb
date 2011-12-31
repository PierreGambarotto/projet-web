require 'spec_helper'

describe UsersController do

  describe "GET 'create'" do
     it "cree un nouvel utilisateur" do 
			post :create, {:login => "test", :email => "tester@mail.com", :password => "test123", :password_confirmation => "test123"}
			assigns(:user).should be_a(User)
		end
  end

end
