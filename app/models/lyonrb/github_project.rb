module Lyonrb
  class GithubProject
    attr_accessor :description, :homepage, :name   
    API_ENDPOINT = "http://github.com/api/v2/xml/repos/show/"
    
    def initialize(attribs = {})
      self.name = attribs.fetch(:name, nil)
      self.description = attribs.fetch(:description, nil)
      self.homepage = attribs.fetch(:homepage, nil)
    end
    
    class << self
      def all
        xml = Net::HTTP.get(URI.parse(API_ENDPOINT+'lyonrb'))
        doc = Nokogiri::XML(xml)
        repositories = doc.search("repositories repository").map do |project|
          description = project.search('description').text rescue ''
          homepage = project.search("homepage").text rescue ''
          name = project.search("name").text rescue ''
          Lyonrb::GithubProject.new :name => name, :description => description, :homepage => homepage
        end
      end
    end
    
  end
end