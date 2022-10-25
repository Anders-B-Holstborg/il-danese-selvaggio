# Il Danese Savaggio

The documentations of a lost wildling deep in the south

* Ruby 3.1.2p20
* Rails 7.0.4
* Postgresql
* Tailwind 3


### Initialization and localhosting

Before launching the app, make sure to run:
`rails db:create db:migrate db:seed`

Afterwards:
`rails s`
will host the app locally on port __8080__.

To enable Tailwind 3s hot reloading, run `rails tailwindcss:watch` in a separate terminal.


### Testing and CI/CD

To run the tests: `bundle exec rspec`

As there are few concepts at play in the app, no namespacing of tests (eg :routes) were added, as it is simpler in this case to run a given file as a whole

The app is using CircleCI for Continuous Integration, and is not using Continuous Deployment (as Heroku would have my scalp otherwise)
