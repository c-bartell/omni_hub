require 'rails_helper'

describe 'User login' do
  describe 'As a visitor' do
    describe 'When I visit "/" and login through the log in link' do
      it 'I am taken to my dashboard page' do
        VCR.use_cassette('oauth_handshake') do
          visit gh_callback_path(code: "24d1ed1389d66d469bda")

          expect(current_url).to eq(dashboard_path)
          expect(page).to have_content("Welcome c-bartell!")
        end
      end
    end
  end
end
