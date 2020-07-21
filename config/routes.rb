Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :applicants, controllers: {
    sessions: 'user/sessions',
    registrations: 'user/registrations',
  }

  namespace :user do
    root 'homes#about'
    get 'top' => 'homes#top', as: 'top'
  end
  
  
end
