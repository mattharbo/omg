Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root :to => "pages#menu"
  resources :competitions, only:[:index]
  resources :clubs, only:[:index]
  resources :teams, only:[:index]
  resources :seasons, only:[:index]
  resources :players, only:[:index,:new,:create]
  resources :fixtures, only:[:index,:show,:edit,:update]
  # get '/game/:id', to: 'fixtures#show'
  resources :eventtypes, only:[:index]
  resources :goals, only:[:index,:new,:create]
  resources :goalevents, only:[:index]
  
end
