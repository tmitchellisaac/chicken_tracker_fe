# Chicken Tracker
This product aims to help users keep track of their animals and shelters on their homestead. Shelters are used to contain a group of animals. Users can manage their homestead by creating, editing, and deleting shelters and animals. They can track details such as animal's name, birthday, and color. Animal pages also include facts and stats based on the animal's species, which is fed by live data from the [Animals API](https://api-ninjas.com/api/animals) by api-ninjas.

Click here to access the front end of our live app: [Chicken Tracker](https://warm-refuge-91806-7859a51228e5.herokuapp.com/) as well as the back end: [Chicken Tracker (backend)](https://hidden-sands-71693-380133048218.herokuapp.com/)
> _NOTE: if you are viewing this after February 2024, the app may no longer be hosted at these links_

Table of Contents
1. [Key Features](#Key-Features)
1. [Installation](#Installation)
1. [Gems Used](#Gems-Used)
1. [Site Navigation](#Site-Navigation)
1. [How to Contribute](#How-to-Contribute)
1. [Contributors](#Contributors)

## Key Features
- OAuth login
- Mobile-friendly design
- Timed Inactive Log Out

## Installation
This project runs on Ruby 3.2.2, Rails 7.1.3.2
To install, please complete these steps:

1. Fork and clone both repositories:
    - The [front end repository](https://github.com/tmitchellisaac/chicken_tracker_fe) handles most of what the user will interact with, including logging in, routing, and page rendering.
    - The [back end repository](https://github.com/n0rdie/chicken-tracker-be) connects to a database where our data is stored and connects to an external API.

1. Run the following commands in each repository to start the servers. Please note, they must be running on different servers. We recommend 5000 for back end and 3000 for front end.
    ```sh
    rails s -p 5000
    ```
1. Run the following command in each terminal to install the gems required to use this application:
    ```sh
    bundle install
    ```
1. Run the following command to drop and create the database and then migrate the schema
    ```sh
    rails db:{drop,create,migrate}
    ```

## Site Navigation
[COMING SOON]

## Gems Used
- [Omniauth](https://github.com/omniauth/omniauth) and [Figaro](https://github.com/laserlemon/figaro) were used for OAuth. 
- [Bootstrap](https://github.com/twbs/bootstrap-rubygem) was used for design on the front end.
- [bcrypt](https://github.com/bcrypt-ruby/bcrypt-ruby) is used to ensure secure login functionality with encrypted passwords.
- [Draper](https://github.com/drapergem/draper) allows us to use decorators in our views.
- [Timecop](https://github.com/travisjeffery/timecop) allows us to test our timed inactive logout functionality.
- [Faraday](https://github.com/lostisland/faraday) is used to make api connections.
- Our application includes extensive testing using [Capybara](https://github.com/teamcapybara/capybara) to simulate user input and interaction.
- This application also uses [Launchy](https://github.com/copiousfreetime/launchy) to view pages in the browser without needing to start the server.
- [Shoulda Matchers](https://github.com/thoughtbot/shoulda-matchers) is used for one-liner testing of model associations and validations.
- [Orderly](https://github.com/jmondo/orderly) is used to check the order in which items appear on the pages for our application.
- [SimpleCov](https://github.com/simplecov-ruby/simplecov) provides test coverage analysis for our application.
- [WebMock](https://github.com/bblimke/webmock) is used to block http requests in our test environment as well as to stub requests.
- [Pry](https://github.com/pry/pry) and [RSpec Rails](https://github.com/rspec/rspec-rails) are used within the testing environment for unit and feature testing.

## How to Contribute

Have a great idea for this app? We'd love to add new features to Chicken Tracker! Follow the steps below and we'll review your pull request.

1. Fork the repo (see Installation steps)
2. Create your feature branch (`git checkout -b feature/fooBar`)
3. Commit your changes (`git commit -am 'Add some fooBar'`)
4. Push to the branch (`git push origin feature/fooBar`)
5. Create a new pull request

## Contributors

- Isaac Mitchell [Github](https://github.com/tmitchellisaac) // [LinkedIn](https://www.linkedin.com/in/tmitchellisaac/)
- Stephen Nash [Github](https://github.com/s2an) // [LinkedIn](https://www.linkedin.com/in/stephen-aa-nash/)
- Quin Nordmark [Github](https://github.com/n0rdie) // [LinkedIn](https://www.linkedin.com/in/quinnordmark/)
- Charles Ren [Github](https://github.com/codeWithRen) // [LinkedIn](https://www.linkedin.com/in/charles-ren-code/)
- Meg Roth [Github](https://github.com/megroth2) // [LinkedIn](https://www.linkedin.com/in/meg-roth/)