class GithubController < ApplicationController
  require 'net/http'
  respond_to :json

  API_ENDPOINT = 'http://github.com/api/v2/json/organizations/lyonrb/public_'

  # params[:resource] in [:members, :repositories]
  def proxy
    url = URI.parse(API_ENDPOINT+params[:resource])
    req = Net::HTTP::Get.new(url.path)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    respond_with(res.body)
  end
end
