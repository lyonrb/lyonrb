Lyonrb::Application.routes.draw do |map|
  match "/application.manifest" => Rails::Offline
  get "events/list"
  get "projects/list"
  get "companies/list"
  get "people/list"

  devise_for :members

  root :to => "welcome#index"
end
