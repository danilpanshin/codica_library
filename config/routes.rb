Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books do
    get '/add/' => 'books#add'
    post 'add_author' => 'books#add_author'
    get '/delete_author_form/' => 'books#delete_author_form'
    post '/delete_author' => 'books#delete_author'
  end

  resources :authors
end
