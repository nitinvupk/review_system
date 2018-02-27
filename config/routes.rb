Rails.application.routes.draw do
  devise_for :users

  resources :movies do
    collection do
      post :import
    end
    member do
      post :add_review
      post :add_comment
    end
  end

  root 'movies#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
