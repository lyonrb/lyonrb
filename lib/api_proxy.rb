class ApiProxy
  require 'open-uri'

  def initialize(endpoint)
    @url = endpoint
  end

  def call(env)
    res = open(@url)
    [200, {}, [res.read]]
  end
end
