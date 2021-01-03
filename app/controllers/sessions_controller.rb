class SessionsController < ApplicationController
  def create
    access_token = OmniAuthFacade.access_token(params[:code])
    user = GitHubFacade.find_or_create_user(access_token)
    session[:user_id] = user.id

    redirect_to dashboard_path
  end
end
