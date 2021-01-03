class SessionsController < ApplicationController
  def create
    access_token = get_access_token(params[:code])
    user_data = get_user_data(access_token)
    user = User.find_or_create_by(uid: user_data[:id])
    user.username = user_data[:login]
    user.uid = user_data[:id]
    user.token = access_token
    user.save

    session[:user_id] = user.id

    redirect_to dashboard_path
  end

  private

  def get_access_token(code)
    conn = Faraday.new(
      url: 'https://github.com',
      headers: { 'Accept': 'application/json' }
    )

    response = conn.post('/login/oauth/access_token') do |req|
      req.params['code'] = code
      req.params['client_id'] = ENV['CLIENT_ID']
      req.params['client_secret'] = ENV['CLIENT_SECRET']
    end

    JSON.parse(response.body, symbolize_names: true)[:access_token]
  end

  def get_user_data(access_token)
    conn = Faraday.new(
      url: 'https://api.github.com',
      headers: {
        'Authorization': "token #{access_token}"
      }
    )

    response = conn.get('/user')

    JSON.parse(response.body, symbolize_names: true)
  end
end
