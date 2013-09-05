
## Beehouse

[![Build Status](https://snap-ci.com/CUZU0sq5W67UgZ-Jkstgn1phfjGsKaXd8oY21ukifiQ/build_image)](https://snap-ci.com/projects/woodpigeon/beehouse/build_history)
[![Code Climate](https://codeclimate.com/github/woodpigeon/beehouse.png)](https://codeclimate.com/github/woodpigeon/beehouse)

### Overview

**beehouse** is a prototype web app for the [Bee Guardian Foundation](http://www.beeguardianfoundation.org) charity.

It is built using Rails 3.2 and Ruby 1.9.3. 

Its uses the [Wicked](https://github.com/schneems/wicked) state machine gem to guide user input, and [rails_admin](https://github.com/sferik/rails_admin) for admin functions and CMS.

It can be easily deployed to [Heroku](http://www.heroku.com).

### Up and running

This assumes you have Ruby 1.9.3 installed using rbenv or rvm, and MySQL running.

```
git clone https://github.com/woodpigeon/beehouse
cd beehouse
bundle install
mv config/application.example.yml config/application.yml 
```

The app uses [figaro](https://github.com/laserlemon/figaro) for injecting ENV variables. Open
```application.yaml``` and amend ```db_user``` and ```db_password``` (instead of updating database.yml).

Now run:

```
bundle exec rake db:setup
bundle exec rails s
```

### Running tests

Initialise the test database with 

```
bundle exec rake db:test:prepare
```

and run tests with 

```
bundle exec rspec
```

Alternatively, for faster tests, install and use [Zeus](https://github.com/burke/zeus). In a separate terminal window or tab run 

```
zeus start
``` 

and then run tests with 

```
zeus test spec
```

### Deploying to Heroku

```
heroku create
git push heroku master
heroku run 'rake db:migrate'
heroku run 'rake db:seed'
heroku open
```
