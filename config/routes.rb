Rails.application.routes.draw do

  resources :students, only: [:index, :show, :auth]

  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # add new student to the databse 

  post '/auth', to:'students#auth'
  # student messages route
  get '/messages', to: 'students#messages'
  # announcements routes
  get '/announcements', to: 'students#announcements'
  # rsults routes 
  get '/results', to: 'students#results'


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

  post '/add_announcement', to: 'announcements#create'
  

  resources :departments



  root 'admins#index'

end
