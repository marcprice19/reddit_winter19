Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'subs#index'


  #resources topics belongs to subs so its embedded like so
  resources :subs do
    resources :topics
  end

end
