Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  namespace :user do
    get 'top' => 'homes#top', as: 'top'
    get 'about' => 'homes#about', as: 'about'
  end
  
  
end
