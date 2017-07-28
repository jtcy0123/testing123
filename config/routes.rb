Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "welcome#index"

  resources :contents, only: [:create, :show]
  resources :stories, only: [:create, :show, :new]
  # get "/:id/stories/new" => "stories#new", as: "new_story"
  # get "/stories/:id/preview" => "stories#preview", as: "preview"
  resources :comments, only: [:create]
  resources :likes, only: [:create]
  resources :messages, only: [:index, :new, :create]

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, only: [:create]

  resources :users, only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"

  get '/redirect/:id' => 'contents#redirect', as: "redirect"

  post "/contents/:id/click" => "contents#click", as: "click"

  post '/search' => 'application#search', as: 'search'

end
