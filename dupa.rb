require 'net/http'

uri = URI('https://clutch.co/profile/software-development-hub')

Net::HTTP.start(uri.host, uri.port,
  :use_ssl => uri.scheme == 'https', 
  :verify_mode => OpenSSL::SSL::VERIFY_NONE) do |http|

  request = Net::HTTP::Get.new uri.request_uri
  request.basic_auth 'john@test.com', 'John123'

  http.request(request) do |response|
    puts response.body
  end
end
