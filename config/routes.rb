Rails.application.routes.draw do

  devise_for :users
  resources :teams
  post 'team_users/edit_multiple'
  put 'team_users/update_multiple'
  resources :user_profile
  resources :projects
  resources :sprints, except: [:index]
  resources :activities, except: [:index]
  resources :colors, except: [:show]
  resources :labels, except: [:show]
  resources :statuses, except: [:show]
  resources :macro_activities, except: [:index, :show]
  resources :progresses, except: [:show, :edit, :update]
  resources :weeks, only: [:edit, :update]


  resources :reports, only: [:index]
  namespace :reports do
    resources :weeks_reports, only: [:index]
    get '/weeks_reports/relative_dedication' => 'weeks_reports#relative_dedication'
    get '/weeks_reports/team_monitoring' => 'weeks_reports#team_monitoring'
    resources :sprints_reports, only: [:index]
    get '/sprints_reports/relative_dedication' => 'sprints_reports#relative_dedication'
    get '/sprints_reports/activities_list' => 'sprints_reports#activities_list'
    get '/sprints_reports/advance_and_completeness' => 'sprints_reports#advance_and_completeness'
    get '/sprints_reports/team_monitoring' => 'sprints_reports#team_monitoring'
  end

  post '/projects/:id/login', to: 'hours_registries#login', as: 'project_login'
  put '/projects/:id/logout', to: 'hours_registries#logout', as: 'project_logout'

  get 'home/index'
  root 'home#index'
  # resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
