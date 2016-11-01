Rails.application.routes.draw do
  root 'links#index'
  resources :links do
    member do
      get 'upvote'
      get 'downvote'
      get 'new'
      get 'visit'
    end
  end
  resources :users

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
