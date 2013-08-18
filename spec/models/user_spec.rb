require 'spec_helper'

describe User do
	it "should indicate if the user is admin" do
		u=User.new
		organization=double(:organization)
		u.should_receive(:organization).and_return(organization)
		organization.should_receive(:created_user_id).and_return(1)
		u.should_receive(:id).and_return(1)
		u.is_admin?.should be_true
	end
end