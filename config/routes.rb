Rails.application.routes.draw do
  get "/users/new",to: redirect("/kaydol")
  get "/users",to: redirect("/kaydol")
  resources :users
  get "/kaydol",to:"users#new",as: :register
  get "/:id",to: "users#show",as: :profile
  get "/:id/edit",to: "users#edit",as: :edit_profile
end
