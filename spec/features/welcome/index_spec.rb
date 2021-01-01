require 'rails_helper'

describe 'As a visitor' do
  describe 'when I visit "/"' do
    before :each do
      visit root_path
    end
    it 'I see a welcome message' do
      expect(page).to have_content("Welcome to OmniHub!")
    end

    it 'I see buttons to log in and register with GH OAuth' do
      expect(page).to have_button('Log In with GitHub Account')
      expect(page).to have_button('Register With GitHub Account')
    end
  end
end
