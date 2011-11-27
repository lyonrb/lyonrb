Lyonrb::Application.routes.draw do
  TWEET_API_ENDPOINT = 'https://api.twitter.com/1/statuses/user_timeline.json?screen_name=LyonRb&count=5'
  REPOS_API_ENDPOINT = 'http://github.com/api/v2/json/organizations/lyonrb/public_repositories'
  USERS_API_ENDPOINT = 'http://github.com/api/v2/json/organizations/lyonrb/public_members'

  match '/api_proxy/members', :to      => ApiProxy.new(USERS_API_ENDPOINT)
  match '/api_proxy/repositories', :to => ApiProxy.new(REPOS_API_ENDPOINT)
  match '/api_proxy/tweets'            => ApiProxy.new(TWEET_API_ENDPOINT)

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
