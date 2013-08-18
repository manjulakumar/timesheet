Timesheets::Application.routes.draw do
  get "team/index"

  devise_for :users
  resources :users,:organizations, :time_entries ,:projects, :clients

  root :to=>"home#index"

  match '/projects' => 'projects#index'

  match '/clients' => 'clients#index'

  get '/reports'	=> 'reports#index'

  get '/team' => 'team#index'
  post '/team' => 'team#create', :as=>:create_member

  get '/reports/:id/monthly_report' => 'reports#monthly_report' ,as: :monthlyreport

  get '/reports/:id/yearly_report' => 'reports#yearly_report' , as: :yearlyreport

  get '/reports/:id/user_efforts_report' => 'reports#user_efforts_report', as: :userefforts

  get '/reports/:id/client_monthly_report' => 'reports#client_monthly_report', as: :clientsreport

   


  







end
