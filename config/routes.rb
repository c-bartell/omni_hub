Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get '/auth/github/callback', to: 'sessions#create', as: :gh_callback

  get '/dashboard', to: 'user/dashboard#show'
end
