Rails.application.routes.draw do
  root to: 'static_pages#index'

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :skills, except: [ :new, :edit ]
    end
  end
end
