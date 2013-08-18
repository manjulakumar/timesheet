class ReportsController < ApplicationController

def index
@time_reports=Project.all
@clients=Client.all

end

def monthly_report
		#@q="select t.effective_date,t.minutes, p.name, t.description  from time_entries t, projects p where t.project_id=p.id group by name order by effective_date;"
		

			#@query ="SELECT t.effective_date,t.minutes,p.name from time_entries t, projects p where t.project_id=p.id   order by effective_date desc ;"
		
		#effort_id=params[:effort_id]

     
		@efforts=TimeEntry.select("sum(minutes) minutes,strftime('%Y-%m-%d',effective_date),user_id ,effective_date, project_id").where("project_id = ? and organization_id =? ", params[:id],current_user.organization).group("strftime('%Y-%m-%d',effective_date),project_id").includes(:project)
		@report_months=@efforts.group_by{ |m| m.effective_date.beginning_of_month}
		
		#@report_years=@reports.group_by{|y| y.effective_date.beginning_of_year }

	end

def yearly_report

	@reports=TimeEntry.joins('LEFT OUTER JOIN projects ON projects.id = time_entries.project_id').where("project_id = ?", params[:id])
	@report_years=@reports.group_by{ |m| m.effective_date.beginning_of_month}
	
	
	end

def user_efforts_report
	@efforts=TimeEntry.select("sum(minutes) minutes,strftime('%Y-%m-%d',effective_date),user_id ,effective_date, project_id").where("project_id = ? and organization_id =? ", params[:id],current_user.organization).group("strftime('%Y-%m-%d',effective_date),project_id,user_id").includes(:project, :user)
	@user_efforts=@efforts.group_by{ |m| m.effective_date.beginning_of_month}

end

def client_monthly_report
	@efforts_to_client=TimeEntry.select("sum(minutes) minutes,strftime('%Y-%m-%d',effective_date),user_id ,effective_date, client_id").where("client_id = ? and organization_id =? ", params[:id],current_user.organization).group("strftime('%Y-%m-%d',effective_date),client_id").includes(:project => :client)
	@monthly_efforts_to_client=@efforts_to_client.group_by{ |m| m.effective_date.beginning_of_month}

end


end
