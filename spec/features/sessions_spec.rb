require 'rails_helper'

describe 'Sessions' do
  describe 'As a visitor' do
    describe 'When I visit the root page and click the log in button' do
      it 'I am taken to the GitHub OAuth page and asked to log in' do
        visit root_path

        expect(ENV['CLIENT_ID']).to_not be nil

        link = "https://github.com/login/oauth/authorize?client_id=#{ENV['CLIENT_ID']}&scope=repo"

        expect(page).to have_link('Log In with GitHub Account', href: link)
      end
    end
  end
end
