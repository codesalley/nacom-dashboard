Rails.application.routes.draw do

  resources :students, only: [:index, :show]

  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/add_student', to: 'admins#add_student'
  post '/add_student', to: 'admins#add_student'
  root 'admins#index'
end
