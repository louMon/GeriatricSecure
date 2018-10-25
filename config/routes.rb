Rails.application.routes.draw do
  get 'menus/index'

  get 'menus/new'

  get 'menus/show'

  get 'menus/edit'

  resources :pathologies
  resources :people
  root 'people#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
