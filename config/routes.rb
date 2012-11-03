MindOverflow::Application.routes.draw do

  devise_for :users

  resources :users

  resources :articles do
    collection do
      get :tag
      get :autocomplete_tag_name
    end
    resources :favorites, :only => [:create,:destroy]
  end

  #resources :favorites, :only => [:create,:destroy]

  root :to => "articles#index"

end
