Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#welcome'
  get '/index' => 'homes#index'
  mount ActionCable.server => "/cable"
end
