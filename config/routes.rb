Rails.application.routes.draw do
  
  devise_for :users

  get 'welcome/index'

  get 'sessions/new'

  root 'welcome#index'

  get :welcome, to: 'welcome#index'
  delete :logout, to: 'sessions#destroy'
 

  resources :tests do
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
    end
  end

end
