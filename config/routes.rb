Rails.application.routes.draw do

  root 'home#index'
  
  get '/contractor/sign_up', to: 'home#contractor_sign_up'
  post '/contractor/sign_up', to: 'home#contractor_create'

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
    resources :contractors, controller: 'legal_profiles', type: 'Contractor'
  end
  
  scope module: 'maps', as: 'dashboard', path: '/dashboard' do
    resources :outdoors
  end
  
end
