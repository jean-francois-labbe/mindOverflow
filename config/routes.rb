MindOverflow::Application.routes.draw do
  devise_for :users

  resources :users

  resources :articles do
    collection do
      get :tag
    end
  end

  root :to => "articles#index"

end
