class ClientsController < ApplicationController

before_filter :authenticate_user!, :client_organization

def index

@client= Client.new

@clients=@organization1.clients

end

def create

	@client= Client.new(params[:client].merge(:organization_id=>current_user.organization_id))



	if @client.save
		
		

		redirect_to clients_path, :notice => "New client created successfully"

	else 

		redirect_to clients_path, :notice => "Client not created "
	end
end


def client_organization
		@org_id=current_user.organization_id
		@organization1=Organization.find(@org_id)

	end
	




end
