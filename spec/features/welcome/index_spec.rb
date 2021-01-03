require 'rails_helper'

describe 'As a visitor' do
  describe 'when I visit "/"' do
    before :each do
      visit root_path
    end

    it 'I see a welcome message' do
      expect(page).to have_content("Welcome to OmniHub!")
    end

    it 'I see a log in button that takes me to the GitHub OAuth page for my app' do
      visit root_path

      expect(ENV['CLIENT_ID']).to_not be nil

      link = "https://github.com/login/oauth/authorize?client_id=#{ENV['CLIENT_ID']}&scope=repo"

      expect(page).to have_link('Log In with GitHub Account', href: link)
    end
  end
end
