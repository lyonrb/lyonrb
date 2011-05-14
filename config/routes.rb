Lyonrb::Application.routes.draw do
  match '/api/v2/json/organizations/lyonrb/public_:resource',      :to => GithubController.action(:proxy)

  namespace 'admin' do
    resources :events
    resources :pages, :except => :show
    resources :categories, :except => :show
    resources :posts, :except => :show
    root :to => "index#index"
  end

  resources :events, :only => :index do
    collection do
      get :upcoming
      get :past
    end
  end

  get "/projects" => "projects#index"
  get "/companies" => "companies#index"
  get "/people" => "people#index"

  devise_for :members
  
  scope '/blog' do
    get '/:id' => 'categories#show', :as => 'category'
    get '/:category_id/:id' => 'posts#show', :as => 'post'
  end
  
  
  get "/:id" => "pages#show", :as => 'page'
  root :to => "welcome#index"
end
