Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :questionnaires, only: [:show] do
    resources :questions, only: [:update]
    resources :responses, only: [:index]
  end
end
