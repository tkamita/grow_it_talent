Rails.application.routes.draw do
  devise_for :corporations, controllers: {
    sessions: 'public/sessions',
    registrations: 'public/registrations',
  }

  namespace :public do
    get 'top' => 'homes#top', as: 'top'
    get 'corporations/edit_job' => 'corporations#edit_job', as: 'edit_job_sheet'
    patch 'corporations/update_job' => 'corporations#update_job'
    resource :corporations, only: [:show, :edit, :update]
    resources :applicants, only: [:index, :show]
    resources :posts, only: [:index, :show]
    resources :portfolios, only: [:index, :show]
    resources :sales, except: [:show, :new, :edit]
  end
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
    resource :applicants, only: [:show, :edit, :update]
    resources :qualifications, except: [:show, :new, :edit]
    resources :posts, except: [:new]
    resources :portfolios
  end
  
  
end
