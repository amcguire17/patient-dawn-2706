Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/competitions', to: 'competitions#index'
  get '/competitions/:id', to: 'competitions#show'

  get '/competitions/:id/teams/new', to: 'tournaments#new'
  post '/competitions/:id/teams', to: 'tournaments#create'

  get '/teams', to: 'teams#index'
end
