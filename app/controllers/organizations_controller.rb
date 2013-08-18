class OrganizationsController < ApplicationController
	before_filter :authenticate_user!
	def new
		@organization = Organization.new
	end
	def create
		@organization = Organization.new(params[:organization])
		@organization.created_user = current_user
		@uid=current_user
		@uemail=User.select("email").where("id = ?",@uid)
		@uemail.each do |uem|
				@organization.created_by=uem.email
		end
		

		if(@organization.save)
			current_user.organization = @organization
			current_user.save!
			
			
			
			redirect_to root_path, :notice=>"Organization created successfully"
		else
			render :action=>:new
		end
	end
end
