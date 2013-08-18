class TimeEntry < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  belongs_to :organization
  
  attr_accessible :billable, :description, 
  				  :minutes , :effective_date,
  				  :project_id, :user_id
end
