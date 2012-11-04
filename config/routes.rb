MindOverflow::Application.routes.draw do

  devise_for :users

  resources :users do
    member do
      get :favorited
      get :published
    end
  end

  resources :articles do
    collection do
      get :tag
      get :autocomplete_tag_name

    end
    member do
      get :favorite
      get :unfavorite
      get :download
    end

    resources :rates, :only => [] do
      collection do
        get :minus
        get :plus
      end
    end
  end

  root :to => "articles#index"

end
