class GitHubService
  class << self
    def user_data(access_token)
      response = conn(access_token).get('/user')

      JSON.parse(response.body, symbolize_names: true)
    end

    private

    def conn(access_token)
      Faraday.new(
        url: 'https://api.github.com',
        headers: {
          'Authorization': "token #{access_token}"
        }
      )
    end
  end
end
