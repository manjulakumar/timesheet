require 'spec_helper'

describe "POST/Time Entries", :type=>:feature do
	
      before do
            @user=User.create!(:email=>"asdf@asdf.com", :password=>"password",:password_confirmation=>"password")
            @org=Organization.new(:name=>"My Org", :created_user_id=>@user.id)
            @user.organization=@org
            @client=Client.create!(:client_name=>"Client 1")
            @user.save!
            1.upto(10) { |i|
                  Project.create!(:name=>"Project #{i}", :client_id=>@client.id)
            }
      end
	it "creates TimeEntry" do
            login_as(@user,:scope=>:user)
            visit "/time_entries"
            
            fill_in "Minutes", :with => 114
            select('Project 1',:from => 'Project')
            fill_in "Description", :with => "Design"

            click_button "Create Time entry"
            
            page.should have_content(114)
            TimeEntry.all.count.should==1
	
	end

end

