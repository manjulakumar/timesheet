class TimeEntriesController < ApplicationController
	before_filter :authenticate_user!, :ensure_user_organization, :timeentry_organization
	
	

	def index
		@time_entry= TimeEntry.new
		@time_entries = @organization.time_entries if current_user.is_admin?
		@time_entries ||= current_user.time_entries
		
	end


	
	respond_to :html, :xml, :json

	def create

		@time_entry= TimeEntry.new(params[:time_entry])
		@time_entry.organization = @org_id
		@time_entry.user_id = current_user.id

		if @time_entry.save
			respond_with do |format|
      			format.html do
      			if request.xhr?
					render @time_entry
				else
					redirect_to time_entries_path
				end
				end
			end
		else
			respond_with do |format|
			format.html do
				if 	request.xhr?
					render :html => @time_entry.errors, :notice => "Unprocessable entity"
				else
					render :action => "index" , :notice => "Timeentry is not added"
				end
			end
			end
		
		end
	end


		

	
	def edit
		@time_entry= TimeEntry.find(params[:id])
		@remote = request.xhr?
		if(@remote)
			render :partial=>"time_entry_form", :locals=>{time_entry: @time_entry, remote: @remote}
			return
		end
	end

	def update

	 @time_entry = TimeEntry.find(params[:id])

      if @time_entry.update_attributes(params[:time_entry])
	        respond_with do |format|
      			format.html do
      			if request.xhr?
					render @time_entry
				else
					redirect_to @time_entry
				end
				end
			end
		else
			respond_with do |format|
			format.html do
				if 	request.xhr?
					render :html => @time_entry.errors, :notice => "Unprocessable entity"
				else
					render :action => "index" , :notice => "Timeentry is not added"
				end
			end
			end
		
		end
	end


	


	




	private 
	def ensure_user_organization
		if user_signed_in? 
	  	if current_user.organization.nil?
	  		redirect_to new_organization_path
	  		return
	  	end
	  end
	 end

	def timeentry_organization
		@org_id=current_user.organization
		@organization=Organization.find(@org_id)

	end
	




end
