Rails.application.routes.draw do

  root 'home#index'
  
  get '/agency/sign_up', to: 'home#agency_sign_up'
  post '/agency/sign_up', to: 'home#agency_create'

  resources "contacts", only: [:create]
  match 'mensage_sent', to: 'home#mensage_sent', via: [:post, :put] 

  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  
  namespace :dashboard do
    root 'home#index'
    resources :physical_profiles
    resources :managers, controller: 'physical_profiles', type: 'Manager' 
    resources :secretaries, controller: 'physical_profiles', type: 'Secretary'
    resources :legal_profiles
    resources :media_companies, controller: 'legal_profiles', type: 'MediaCompany' 
    resources :agencies, controller: 'legal_profiles', type: 'Agency'
    resources :advertisers, controller: 'legal_profiles', type: 'Advertiser'
  end
  
  scope module: 'maps', as: 'dashboard', path: '/dashboard' do
    resources :outdoors
  end
  
end
