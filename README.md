# Chicken Tracker
> This product aims to help users keep track of their animals and shelters on their homestead. Shelters are used to contain a group of animals.

## Installation
This project runs on Rails 7.0.8 and is not compatible with Windows.
1. Fork and clone [this repository](https://github.com/tmitchellisaac/chicken_tracker_fe), which is the front-end of our application. The front end repository handles most of what the user will interact with, including routing and page rendering. 
1. Fork and clone [this repository](https://github.com/n0rdie/chicken-tracker-be) to access our back-end. The back end repository connects to a database where our data is stored and connects to an external API.

## API
We used the [Animals API](https://api-ninjas.com/api/animals) by api-ninjas.

## Why Use Chicken Tracker?


### Log In
Users can create an account using their email. This product includes 2 Factor Authentication. Once an account has been made, the user will be able to login and see their home page.

### Site Navigation
From the home page, the user can ...
The user can access their shelters by visiting the Shelters Index page.
The user can view all animals that belong to a given Shelter by visiting the Animals Index page.


## Development setup
Download both our front end and backend applications (see Installation steps above).

Start the server on the back end and front end applications by typing the following in the terminal of both.

  ```sh
  rails s
  ```

NOTE: The back-end application should be running on PORT 5000,
while the front-end application should be running on PORT 3000.

Run the following code in your terminal to install the gems required to use this application:
  ```sh
  bundle install
  ```

Check to make sure all the tests are passing by running the following code in your terminal:
  ```sh
  bundle exec rspec
  ```

## Gems Used
- [Omniauth](https://github.com/omniauth/omniauth) was used for Oauth. 
- [Bootstrap](https://github.com/twbs/bootstrap-rubygem) was used extensively for design on the front end.

  Example of bootstrap code
    ```    <form class="d-flex w-50" action="/third_spaces/search" method="get" name="name" id="name">
          <input class="form-control me-2" id="name" name="name" type="text" placeholder="search by name" aria-label="Search" style="flex-grow: 1;">
          <button class="small-default-button" type="submit" style="margin-right: 2rem;">Search</button>
        </form>
    ```

- Our application includes extensive testing using the [Capybara gem](https://github.com/teamcapybara/capybara) to simulate user input and interaction.
- This application also uses the [Launchy Gem](https://github.com/copiousfreetime/launchy) to view pages in the browser without needing to start the server.
- The [Shoulda Matchers Gem](https://github.com/thoughtbot/shoulda-matchers) is used for one-liner testing of models.
- The [Orderly Gem](https://github.com/jmondo/orderly) is used to check the order in which items appear on the pages for our application.
- The [SimpleCov Gem](https://github.com/simplecov-ruby/simplecov) provides test coverage analysis for our application.
- The [FactoryBot](https://github.com/thoughtbot/factory_bot) and [Faker Gems](https://github.com/faker-ruby/faker) was used to create large amounts of data for testing. 
- The [Rails Controller Testing](https://github.com/rails/rails-controller-testing) gem was used to test some controller actions, such as `assign` to access instance variables  and `assert` to make sure certain templates were rendered
- The back end handles API calls to the TomTom API as well as accepts post requests from the user for location moods. It simulates API calls using the [WebMock gem](https://github.com/bblimke/webmock) and the [VCR gem](https://github.com/vcr/vcr).
- Both use the [Pry gem](https://github.com/pry/pry) and [RSpec Rails](https://github.com/rspec/rspec-rails) within the testing environment for unit and feature testing.

## Primary Contributors

Name: [Email]() [LinkedIn]()
Name: [Email]() [LinkedIn]()
Name: [Email]() [LinkedIn]()
Name: [Email]() [LinkedIn]()
Name: [Email]() [LinkedIn]()

## Contributing

1. Fork the repo (see Installation steps)
2. Create your feature branch (`git checkout -b feature/fooBar`)
3. Commit your changes (`git commit -am 'Add some fooBar'`)
4. Push to the branch (`git push origin feature/fooBar`)
5. Create a new Pull Request