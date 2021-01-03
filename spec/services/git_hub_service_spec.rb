require 'rails_helper'

describe 'GitHub API service' do
  it 'can get user data' do
    VCR.use_cassette('user_data_request') do
      user_data = GitHubService.user_data(ENV['ACCESS_TOKEN'])

      expect(user_data).to be_an(Hash)

      expect(user_data).to have_key(:login)
      expect(user_data[:login]).to be_an(String)
      expect(user_data[:login]).to eq('c-bartell')

      expect(user_data).to have_key(:id)
      expect(user_data[:id]).to be_an(Integer)
      expect(user_data[:id]).to eq(60277914)
    end
  end
end
