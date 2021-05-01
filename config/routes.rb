Rails.application.routes.draw do

  namespace :api, :constraints => {:subdomain => "api"} do

      resources :people

  end
  namespace :api, :constraints => {:subdomain => "dashboard"} do
      resources :people
  end

  resources :students, only: [:index, :show, :auth]
  devise_for :admins
  resources :messages
  resources :announcements
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # add new student to the databse 

  post '/student', to: 'students#index'

  get '/checkToken', to: 'students#checkToken'

  post '/auth', to:'students#auth'
  # student messages route
  get '/message', to: 'students#messages'
  # announcements routes
  get '/announce', to: 'students#announcements'
  # rsults routes 
  get '/result', to: 'students#results'

  get '/me', to: 'students#welcome'


  # dashboard enpoints 

  get '/new_student', to: 'admins#new_student'
  post '/add_student', to: 'admins#add_student'

  # add new simsters or coharts

  post '/add_semister', to: 'admins#add_semister'

  # new department post action 

  post '/add_department', to: 'admins#add_department'

  # add new new results and asign to student and semister 

  get '/new_results', to: 'admins#new_result'
  post '/add_results', to: 'admins#add_result'


  post '/add_message', to: 'messages#create'



  post '/add_announcement', to: 'announcements#create'
  

  resources :departments



  root 'admins#index'

end
