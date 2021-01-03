require 'rails_helper'

describe 'GitHub Oauth Service' do
  it 'can get an access token' do
    VCR.use_cassette('oauth_handshake') do
      # Code must be retrieved manually from the 'code' param sent in GH Oauth
      # login callback. This code is single use and only lasts 10 minutes, so
      # this must be done every time the cassettes are created.
      code = '24d1ed1389d66d469bda'
      response = OmniAuthService.request_token(code)

      expect(response).to be_an(Hash)
      expect(response).to have_key(:access_token)

      expect(response).to have_key(:token_type)
      expect(response[:token_type]).to be_an(String)
      expect(response[:token_type]).to eq('bearer')

      expect(response).to have_key(:scope)
      expect(response[:scope]).to be_an(String)
      expect(response[:scope]).to eq('repo')
    end
  end
end
