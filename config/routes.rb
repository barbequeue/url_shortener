Rails.application.routes.draw do

  root 'links#index'
  post '/' => 'links#create'
  get '/:shorthand' => 'links#show'
  delete '/:id' => 'links#destroy'

  get '*path' => redirect('/')

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
