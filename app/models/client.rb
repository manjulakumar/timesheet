class Client < ActiveRecord::Base
  attr_accessible :client_name,:project_id,:organization_id

   has_many :projects
   belongs_to :organization
   
end
