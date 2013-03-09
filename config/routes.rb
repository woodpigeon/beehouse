Beehouse::Application.routes.draw do
  
  root to: "houses#new"
  resources :houses, :only => [:show, :create, :new, :edit]

end
