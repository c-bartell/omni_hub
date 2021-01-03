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
    OmniAuthService.request_token(code)[:access_token]
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
