Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tests do
    resources :questions
  end


  #delete '/tests/:test_id/questions/:id', to: 'questions#destroy', as: 'question_destroy'

  #get '/tests/:test_id/questions', to: 'questions#index'
  #get '/tests/:test_id/questions', to: 'questions#create'
end
