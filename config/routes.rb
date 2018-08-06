Rails.application.routes.draw do
  resources :funastars
  get 'blogs/index'
resources :blogs
# collection do
#       post :confirm
#     end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
