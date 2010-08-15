class WelcomeController < ApplicationController
  def index
    @content_for_title = "Rubyist community of Lyon, France"
    html = Net::HTTP.get(URI.parse("http://github.com/lyonrb"))
    doc = Nokogiri::HTML(html)
    @members = doc.search("ul.org-members li").map do |member|
      avatar = member.search("img").attribute('src').text
      login = member.search("h4 a").text
      if member.search("h4 em").text =~ /\((.*)\)/
        name = $1
      end
      repo_summary = member.search("p").text
      { :login => login, :name => name, :repo_summary => repo_summary, :avatar => avatar }
    end
  end
end
