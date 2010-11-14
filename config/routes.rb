Lyonrb::Application.routes.draw do

  namespace 'admin' do
    resources :events
    resources :pages, :except => :show
    root :to => "index#index"
  end

  get "/events" => "events#index"
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
