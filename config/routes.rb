Rails.application.routes.draw do
  root to: 'welcome#index'
  resources :borrowers do
    resources :payments
  end
  get '/investor' => 'investor#index'
  get '/investor/show' => 'investor#show'
  resources :investor, only: 'create'
end

