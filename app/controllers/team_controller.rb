class TeamController < ApplicationController
  before_filter :authenticate_user!
	

	  def index
		  	@user=User.new
		  	@team=User.all
	  end

	  
	def create
    @user = User.new(params[:user].merge(:password=>"password", 
    									 :password_confirmation=>"password",
    									 :organization_id=>current_user.organization_id))

	    if @user.save
	          respond_to do |format|
	           format.html { redirect_to team_path }
	       		end
	    else
	      respond_to do |format| 
	        format.xml  { head :ok }
	        format.html { render :team_path ,:status => :unprocessable_entity }
	      end
	    end

	end
end
