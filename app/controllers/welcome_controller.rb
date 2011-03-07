class WelcomeController < ApplicationController
  def index
    @content_for_title = "Rubyist community of Lyon, France"
    @members = Lyonrb::GithubMember.all
    @projects = Lyonrb::GithubProject.all
    @next_event = Event.next
    @posts = Post.published.lasts.limit(3)
  end
end
