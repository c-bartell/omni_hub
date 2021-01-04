# OmniHub
OmniHub is simple app that I built to learn OAuth implementation, and to practice API endpoint consumption.

## Using OmniHub
1. Clone down OmniHub to your local machine by running the following terminal command:
`$ git clone git@github.com:c-bartell/omni_hub.git`
2. Run `$ bundle install` and `$ rake db:{create,migrate}`
3. Start your local server by running `$ rails s`
4. Visit `localhost:3000` in your browser:
![omni_hub_landing](https://user-images.githubusercontent.com/60277914/103494637-fc964e80-4df4-11eb-81c7-6d78b2b908e7.jpg)
5. To log in or register, click `Log In with GitHub Account`, then log in with your GitHub credentials:
![gh_oauth_page](https://user-images.githubusercontent.com/60277914/103494794-90681a80-4df5-11eb-9223-2148164739a9.jpg)
6. Once you have signed in, you will be redirected to the user dashboard, where you will see a lists of the names of both your public and private repos:
![user_dashboard](https://user-images.githubusercontent.com/60277914/103494933-2734d700-4df6-11eb-8730-51b3d6dd41d2.jpg)
