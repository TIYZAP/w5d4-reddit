Rails.application.routes.draw do
  root 'links#index'
  resources :links do
    member do
      get 'upvote'
      get 'downvote'
      get 'new'
    end
  end
  resources :users


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
