Rails.application.routes.draw do

  resources :students, only: [:index, :show]

  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # add new student to the databse 

  get '/add_student', to: 'admins#add_student'
  post '/add_student', to: 'admins#add_student'

  # add new simsters or coharts

  get '/add_semister', to: 'admins#add_semister'
  post '/add_semister', to: 'admins#add_semister'

  # add new new results and asign to student and semister 

  get '/add_results', to: 'admins#add_result'
  post '/add_results', to: 'admins#add_result'

  resources :announcements
  resources :messages
  resources :departments



  root 'admins#index'

end
