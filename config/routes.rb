Rails.application.routes.draw do
  root 'hello#index'
  
  get '/api', to: 'application#api'
end
