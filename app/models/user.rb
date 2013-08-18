class User < ActiveRecord::Base
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :organization_id
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
         #, :trackable

         #, :validatable

  # attr_accessible :title, :body
  # after_create :send_email
  belongs_to :organization
  has_many :time_entries , order: 'effective_date desc'
  has_many :projects

  def send_email
    Notifier.welcome_email(self).deliver
  end

  def is_admin?
    self.organization.created_user_id==self.id
  end
  
end
