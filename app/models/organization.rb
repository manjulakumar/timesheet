class Organization < ActiveRecord::Base
  attr_accessible :name, :created_user_id
  has_many :users
  has_many :time_entries
  has_many :clients
  belongs_to :created_user, :class_name=>"User", :foreign_key=>:created_user_id

  validates_presence_of :name
end
