Rails.application.routes.draw do
  namespace :site do
    get 'home', to: 'home#index'

    namespace :profile do
      resources :dashboard, only: %i[index]
    end
  end

  get 'backoffice', to: 'backoffice/dashboard#index'
  namespace :backoffice do
    get 'dashboard', to: 'dashboard#index'
    resources :send_email, only: %i[edit create]
    resources :admins, except: %i[show]
    resources :categories, except: %i[show destroy]
  end
  devise_for :admins, skip: [:registrations]
  devise_for :members
  root 'site/home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
