LoginApp::Application.routes.draw do
  resources :boards do 
   resources :conversations
  end

  
  resources :conversations do
    resources :comments
   end

  resources :users do
    resources :conversations
  end

  root :to => "boards#index"

  resources :user_sessions, :comments
  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout

  match '/conversations/board/:board_id/' => "conversations#new", :as => :create_post
  match '/conversations/:id/reply/' => "conversations#reply", :as => :post_reply
  
  get '/boards/:board_id/conversations/:id/reply' => "conversations#reply", :as => :reply_board_conversation
  post '/boards/:board_id/conversations/:id/reply' => "conversations#save_reply", :as => :reply_board_conversation
end
