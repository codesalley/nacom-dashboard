Rails.application.routes.draw do

  resources :students, only: [:index, :show]

  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # add new student to the databse 

  get '/student', to: 'admins#add_student'
  post '/student', to: 'admins#add_student'

  # add new simsters or coharts

  get '/semister', to: 'admins#add_semister'
  post '/semister', to: 'admins#add_semister'

  # add new new results and asign to student and semister 

  get '/results', to: 'admins#add_result'
  post '/results', to: 'admins#add_result'



  root 'admins#index'

end
