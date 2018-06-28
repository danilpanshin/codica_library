Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books do
    get '/add/' => 'books#add'
    post 'add_author' => 'books#add_author'
    get '/delete_author_form/' => 'books#delete_author_form'
    post '/delete_author' => 'books#delete_author'
  end

  resources :authors

  resources :categories do
    get '/add/' => 'categories#add'
    post 'add_book' => 'categories#add_book'
    get '/delete_book_form/' => 'categories#delete_book_form'
    post '/delete_book' => 'categories#delete_book'
  end

  root to: 'categories#index'
end
