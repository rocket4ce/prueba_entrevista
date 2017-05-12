Rails.application.routes.draw do

  resources :gps


  namespace :api do # Ruta para la api 
  	namespace :v1 do # Ruta para la version a consumir
  		resources :gps, only: [:create, :show]
  	end
  end
  
end
