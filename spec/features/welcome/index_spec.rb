require 'rails_helper'

describe 'As a visitor' do
  describe 'when I visit "/"' do
    it 'I see a welcome page' do
      visit root_path

      expect(page).to have_content("Welcome to OmniHub!")
    end
  end
end
