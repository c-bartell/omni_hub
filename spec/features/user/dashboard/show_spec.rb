require 'rails_helper'

describe 'User Dashboard' do
  describe 'As a user, when I visit "/dashboard"' do
    before :each do
      user = create :user, token: ENV['ACCESS_TOKEN']
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    end

    it 'I see a list of all of my repos, and a list of all of my private repos' do
      VCR.use_cassette('user_repos') do
        visit dashboard_path

        total_repos = 46
        public_repos = 41
        private_repos = 5

        expect(page).to have_css('.repo', count: total_repos)
        expect(page).to have_css('.public-repo', count: public_repos)
        expect(page).to have_css('.private-repo', count: private_repos)

        within '#public-repos' do
          expect(page).to have_css('.public-repo', count: public_repos)
          expect(page).to have_css('.private-repo', count: 0)
          within first '.public-repo' do
            expect(page).to have_content('c-bartell/activerecord-obstacle-course')
          end
        end

        within '#private-repos' do
          expect(page).to have_css('.private-repo', count: private_repos)
          expect(page).to have_css('.public-repo', count: 0)
          within first '.private-repo' do
            expect(page).to have_content('c-bartell/cli_tarot')
          end
        end
      end
    end
  end
end
