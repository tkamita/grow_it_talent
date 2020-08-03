Rails.application.routes.draw do

  root 'user/homes#about'

  resources :rooms, only: [:show, :create, :index] do
    resources :messages, only: [:create]
  end
  
  
  devise_for :corporations, controllers: {
    sessions: 'public/sessions',
    registrations: 'public/registrations',
  }

  namespace :public do
    get 'top' => 'homes#top', as: 'top'
    get 'corporations/edit_job' => 'corporations#edit_job', as: 'edit_job_sheet'
    patch 'corporations/update_job' => 'corporations#update_job'
    get 'posts/applicant:id/specific_index' => 'posts#specific_index'
    get 'portfolios/applicant:id/specific_index' => 'portfolios#specific_index', as: 'specific_user'
    resource :corporations, only: [:show, :edit, :update]
    resources :applicants, only: [:index, :show] do
      resources :offers, only: [:create, :destroy]
    end
    resources :posts, only: [:index, :show]
    resources :portfolios, only: [:index, :show]
    resources :sales, except: [:show, :new, :edit]
    resources :applies, only: [:index]
    resources :corpo_notices, only: [:index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :applicants, controllers: {
    sessions: 'user/sessions',
    registrations: 'user/registrations',
  }

  namespace :user do
    get 'top' => 'homes#top', as: 'top'
    get 'applicants/work' => 'applicants#work', as: 'work_history'
    get 'applicants/edit_work' => 'applicants#edit_work', as: 'edit_work_history'
    patch 'applicants/update_work' => 'applicants#update_work'
    resource :applicants, only: [:show, :edit, :update]
    resources :qualifications, except: [:show, :new, :edit]
    resources :posts, except: [:new]
    resources :portfolios
    resources :offers, only: [:index]
    resources :corporations, only: [:show] do
      resources :applies, only: [:create, :destroy]
    end
    resources :user_notices, only: [:index]
  end
  
  
end
