MindOverflow::Application.routes.draw do
  devise_for :users

  resources :users

  resources :articles do
    collection do
      get :tag
      get :autocomplete_tag_name
    end
  end

  root :to => "articles#index"

end
