class ProjectsController < ApplicationController
before_filter :authenticate_user! 

def index

@project= Project.new

@client=current_user.clients

@projects = @client.projects

end

def create

	@project= Project.new(params[:project])

	if @project.save
		
		redirect_to projects_path, :notice => "New projects created successfully"

	else 

		redirect_to projects_path, :notice => "Project not created "
	end
end



end





