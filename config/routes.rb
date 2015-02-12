Rails.application.routes.draw do

  root 'home#index'

  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  resources :physical_profiles
  
  namespace :dashboard do
    root 'home#index'
    resources :legal_profiles
    resources :media_companies, controller: 'legal_profiles', type: 'MediaCompany' 
    resources :contractors, controller: 'legal_profiles', type: 'Contractor'
  end
  
  scope module: 'maps', as: 'dashboard', path: '/dashboard' do
    resources :outdoors
  end
  
end
