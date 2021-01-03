require 'rails_helper'

describe 'User login' do
  describe 'As a visitor' do
    describe 'When I visit "/" and login through the log in link' do
      it 'I am taken to my dashboard page' do
        VCR.use_cassette('oauth_handshake') do
          # Code must be retrieved manually from the 'code' param sent in GH
          # Oauth login callback. This code is single use and only lasts 10
          # minutes, so this must be done every time the cassettes are created.
          visit gh_callback_path(code: ENV['TEST_CODE'])

          expect(current_path).to eq(dashboard_path)
          expect(page).to have_content("Welcome, c-bartell!")
        end
      end
    end
  end
end
