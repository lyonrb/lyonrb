module Lyonrb
  class GithubMember
    attr_accessor :name, :login, :avatar, :email

    def initialize(attribs = {})
      self.name = attribs.fetch(:name, nil)
      self.login = attribs.fetch(:login, nil)
      self.avatar = attribs.fetch(:avatar, nil)
      self.email = attribs.fetch(:email, "lyonrb@lyonrb.fr")
    end

    def self.all
      html = Net::HTTP.get(URI.parse("http://github.com/lyonrb"))
      doc = Nokogiri::HTML(html)
      members = doc.search("ul.org-members li").map do |member|
        avatar = member.search("img").attribute('src').text
        login = member.search("h4 a").text
        if member.search("h4 em").text =~ /\((.*)\)/
          name = $1
        end
        repo_summary = member.search("p").text
        Lyonrb::GithubMember.new :login => login, :name => name, :repo_summary => repo_summary, :avatar => avatar
      end
    end
  end
end
