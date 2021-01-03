class OmniAuthService
  class << self
    def request_token(code)
      response = conn.post('/login/oauth/access_token') do |req|
        req.params['code'] = code
        req.params['client_id'] = ENV['CLIENT_ID']
        req.params['client_secret'] = ENV['CLIENT_SECRET']
      end

      JSON.parse(response.body, symbolize_names: true)
    end

    private

    def conn
      private_class_method
      Faraday.new(
        url: 'https://github.com',
        headers: { 'Accept': 'application/json' }
      )
    end
  end
end
