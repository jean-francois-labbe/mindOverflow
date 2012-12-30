MindOverflow::Application.routes.draw do

  resources :questions

  devise_for :users

  resources :users do
    member do
      get :favorited
      get :published
      get :approve
      get :block
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
      get :download_attachment
      get :delete_attachment
      get :open_attachment
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
