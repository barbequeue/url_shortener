Rails.application.routes.draw do

  root 'links#index'
  get '/' => 'links#new'
  post '/' => 'links#create'
  get '/:shorthand' => 'links#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
