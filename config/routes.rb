Rails.application.routes.draw do
  namespace :site do
    get 'home', to: 'home#index'
    get 'search', to: 'search#ads'

    namespace :profile do
      resources :dashboard, only: %i[index]
      resources :ads, only: %i[index edit update new create]
    end

    resources :ad_details, only: %i[show]
    resources :categories, only: %i[show]
  end

  get 'backoffice', to: 'backoffice/dashboard#index'
  namespace :backoffice do
    get 'dashboard', to: 'dashboard#index'
    resources :send_email, only: %i[edit create]
    resources :admins, except: %i[show]
    resources :categories, except: %i[show destroy]
    resources :diagrams, only: %i[index]
  end
  devise_for :admins, skip: [:registrations]
  devise_for :members, controllers: { sessions: 'members/sessions'}
  root 'site/home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
