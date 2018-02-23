Rails.application.routes.draw do

  resources :cocktails do
    resources :doses, except: [ :destroy ]
  end
  resources :doses, only: [ :destroy ]
  resources :ingredients
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  root to: 'articles#index'
  resources :articles, except: :index
end
