MindOverflow::Application.routes.draw do
  resources :articles do
    collection do
      get :tag
    end
  end
end
