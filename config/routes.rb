Rails.application.routes.draw do
  root :to => "financial_operations#index"
  resources :financial_operations
end
