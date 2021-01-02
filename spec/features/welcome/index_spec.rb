require 'rails_helper'

describe 'As a visitor' do
  describe 'when I visit "/"' do
    before :each do
      visit root_path
    end
    it 'I see a welcome message' do
      expect(page).to have_content("Welcome to OmniHub!")
    end
  end
end
