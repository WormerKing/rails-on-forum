Rails.application.routes.draw do
  get "/users/new",to: redirect("/kaydol")
  get "/users",to: redirect("/kaydol")
  resources :users
  get "/kaydol",to:"users#new",as: :register
end
