require 'rails_helper'

describe 'GitHub Service Facade' do
  it 'Can find or create a user' do
    VCR.use_cassette('user_data_request') do
      user = GitHubFacade.find_or_create_user(ENV['ACCESS_TOKEN'])

      expect(user).to be_an(User)

      expect(user.id).to be_an(Integer)

      expect(user.username).to be_an(String)
      expect(user.username).to eq('c-bartell')

      expect(user.uid).to be_an(String)
      expect(user.uid).to eq('60277914')

      expect(user.token).to be_an(String)
      expect(user.token).to eq(ENV['ACCESS_TOKEN'])
    end
  end
end
