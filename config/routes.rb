Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
  }
     resources :chat_rooms, only: [:index, :create, :show]
     resources :messages, only: [:create]

     get "/companions" => "users#companions"
     post "/toggle_period" => "users#toggle_period"
     mount ActionCable.server => '/cable'

end