Lyonrb::Application.routes.draw do

  namespace 'admin' do
    resources :events
    root :to => "index#index"
  end

  get "/events" => "events#index"
  get "/projects" => "projects#index"
  get "/companies" => "companies#index"
  get "/people" => "people#index"

  devise_for :members

  root :to => "welcome#index"
end
