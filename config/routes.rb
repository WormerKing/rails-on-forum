Rails.application.routes.draw do
  get "/oturum_ac",to: "sessions#new",as: :login
  delete "/oturumu_kapat",to: "sessions#destroy",as: :logout

  resource :session,only: :create

  resources :forums,only:%i[ index show ],path:"forumlar" do
    resources :topics,only:%i[ new create ],path:"konular",path_names:{new:"yeni"}
  end

  resources :topics,except:%i[index new create],path:"konular",path_names:{edit:"düzenle"} do
    resources :comments,only:%i[ new create ],path:"Yorumlar",path_names:{new:"yeni"}
    resources :comments,only:%i[ edit update destroy ],path:"Yorumlar",path_names:{edit:"Düzenle"}
  end

  resources :users,only:%i[ create update destroy]

  #get "/forumlar",to: "forums#index",as: :forums
  #get "/forumlar/:id",to: "forums#show",as: :forum

  get "/users/new",to: redirect("/kaydol")
  get "/users",to: redirect("/kaydol")

  get "/kaydol",to:"users#new",as: :register
  get "/:id",to: "users#show",as: :profile
  get "/:id/düzenle",to: "users#edit",as: :edit_profile

  root "forums#index"
end
