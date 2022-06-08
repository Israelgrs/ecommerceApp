Rails.application.routes.draw do
  namespace :site do
    get 'home', to: 'home#index'
  end

  get 'backoffice', to: 'backoffice/dashboard#index'
  namespace :backoffice do
    get 'dashboard', to: 'dashboard#index'
    resources :admins, except: %i[show destroy]
    resources :categories, except: %i[show destroy]
  end
  devise_for :admins, skip: [:registrations]
  devise_for :members
  root 'site/home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
