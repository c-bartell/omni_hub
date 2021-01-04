class User::DashboardController < ApplicationController
  def show
    @public_repos = repos.reject do |repo|
      repo[:private]
    end
    @private_repos = repos.select do |repo|
      repo[:private]
    end
  end

  private

  def repos
    @repos ||= repo_array
  end

  def repo_array
    conn = Faraday.new(
      url: 'https://api.github.com',
      headers: {
        'Authorization': "token #{current_user.token}"
      }
    )
    response = conn.get('/user/repos') do |req|
      req.params[:per_page] = 100
    end

    JSON.parse(response.body, symbolize_names: true)
  end
end
