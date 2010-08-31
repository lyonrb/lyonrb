module HttpMocks
  
  def self.repositories_list
    FakeWeb.register_uri(
      :get,
      'http://github.com/api/v2/xml/repos/show/lyonrb',
      :body => File.read(Rails.root.join('spec', 'fixtures', 'repositories_list.xml'))
    )
  end
end
