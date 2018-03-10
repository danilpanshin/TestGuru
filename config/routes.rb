Rails.application.routes.draw do
  
  get 'contact_forms/new'

  get 'contact_forms/create'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }, controllers: { sessions: 'user/sessions' }
 


  get 'welcome/index'
  root 'welcome#index'
  get :welcome, to: 'welcome#index'
  
  resources :contact_forms, only: %i[new create]

  resources :tests, only: :index do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member  

      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
        end 
    end
    resources :gists, only: :index 
  end



end
