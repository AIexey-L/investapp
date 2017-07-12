Rails.application.routes.draw do
  root to: 'welcome#index'
  resources :borrowers do
    resources :payments
  end
end

