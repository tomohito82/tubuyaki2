Rails.application.routes.draw do
  root :to => 'tweeets#index'
  resources :tweeets, only: [:index, :new, :create, :destroy, :edit, :update] do
    collection do
      post :confirm
    end
  end
end