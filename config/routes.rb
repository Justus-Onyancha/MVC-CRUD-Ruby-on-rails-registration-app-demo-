Rails.application.routes.draw do
  get 'resource/registers'
  get 'resource/index'
  get 'registers/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
# Rails.application.routes.draw do
#   resources :registers
#   #get '/search' => 'registers#search', :as => 'search_page'
#   # get 'resource/registers'
#   # get 'resource/index'
#   # get 'registers/index'

#   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# end

