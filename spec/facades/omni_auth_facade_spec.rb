require 'rails_helper'

describe 'Git Hub OAuth Facade' do
  it 'Returns a user access_token' do
    VCR.use_cassette('oauth_handshake') do
      # Code must be retrieved manually from the 'code' param sent in GH Oauth
      # login callback. This code is single use and only lasts 10 minutes, so
      # this must be done every time the cassettes are created.
      code = ENV['TEST_CODE']
      access_token = OmniAuthFacade.access_token(code)

      expect(access_token).to eq(ENV['ACCESS_TOKEN'])
    end
  end
end
