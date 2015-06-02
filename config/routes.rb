Rails.application.routes.draw do
 get "/" => "pages#home"
 get "/contacts" => "pages#index"
 get "/"
end
