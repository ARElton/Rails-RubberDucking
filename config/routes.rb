Rails.application.routes.draw do
  resources :ducks, except: [:distroy]
  resources :students, excpet: [:distory]
end
