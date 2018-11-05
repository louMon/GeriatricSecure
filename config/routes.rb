Rails.application.routes.draw do
  
  resources :pacientes
  resources :cita
  resources :registro_consulta
  resources :historia_clinicas

  devise_for :usuarios
    authenticated :usuario do
      root 'cita#index'
    end

    unauthenticated do
      root 'devise/sessions#new'
    end


end