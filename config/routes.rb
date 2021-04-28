Rails.application.routes.draw do

  resources :students, only: [:index, :show]

  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # add new student to the databse 

  get '/new_student', to: 'admins#new_student'
  post '/add_student', to: 'admins#add_student'

  # add new simsters or coharts

  post '/add_semister', to: 'admins#add_semister'

  # new department post action 

  post '/add_department', to: 'admins#add_department'

  # add new new results and asign to student and semister 

  get '/new_results', to: 'admins#new_result'
  post '/add_results', to: 'admins#add_result'

  resources :messages

  post '/add_message', to: 'messages#create'


  

  resources :announcements
  resources :departments



  root 'admins#index'

end
