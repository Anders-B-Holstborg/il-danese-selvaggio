# Il Danese Selvaggio

The documentations of a lost wildling deep in the south

* Ruby 3.2.2
* Rails 7.0.5
* Postgresql 1.5.3
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

The app is using CircleCI for Continuous Integration, and is not yet using Continuous Deployment
