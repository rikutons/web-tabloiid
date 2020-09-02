Rails.application.routes.draw do
  resources :reports
  root 'reports#index'
  get '/new' , to: 'reports#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
