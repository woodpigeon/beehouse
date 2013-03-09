Beehouse::Application.routes.draw do
  
  root to: "home#index"
  resources :houses, :only => [:create, :new, :show]

end
