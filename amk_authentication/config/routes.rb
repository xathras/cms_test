AmkAuthentication::Engine.routes.draw do
  get 'login' , to: 'sessions#new'
  post 'login' , to: 'sessions#create' , as: 'sessions'
  delete 'logout' , to: 'sessions#destroy'
end
