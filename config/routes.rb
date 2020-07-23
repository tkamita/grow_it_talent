Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :applicants, controllers: {
    sessions: 'user/sessions',
    registrations: 'user/registrations',
  }

  namespace :user do
    root 'homes#about'
    get 'top' => 'homes#top', as: 'top'
    get 'applicants/work' => 'applicants#work', as: 'work_history'
    get 'applicants/edit_work' => 'applicants#edit_work', as: 'edit_work_history'
    patch 'applicants/update_work' => 'applicants#update_work'
    resources :qualifications, except: [:show, :new, :edit]
    resource :applicants, only: [:show, :edit, :update]
  end
  
  
end
