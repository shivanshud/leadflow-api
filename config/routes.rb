Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  namespace :api do
    namespace :v1 do
      post 'signup',
        to: 'auth#signup'

      post 'login',
        to: 'auth#login'
      
      get 'my_leads',
        to: 'leads#my_leads'
      
      patch 'availability',
        to: 'users#availability'


      resources :leads,
        only: [:index, :create]
      resources :users,
        only: [:create, :index]
    end
  end
end