class GitHubFacade
  class << self
    def find_or_create_user(access_token)
      user_data = GitHubService.user_data(access_token)
      user = User.find_or_create_by(uid: user_data[:id])
      user.username = user_data[:login]
      user.uid = user_data[:id]
      user.token = access_token
      user.save

      user
    end
  end
end
