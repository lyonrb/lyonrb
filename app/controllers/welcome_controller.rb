class WelcomeController < ApplicationController
  def index
    @content_for_title = "Rubyist community of Lyon, France"
    @members = Lyonrb::GithubMember.all
    @projects = Lyonrb::GithubProject.all
  end
end
