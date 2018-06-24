Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books do
    get :add_author
    post :add_author
    put :add_author
    patch :add_author
  end
  
  resources :authors
end
