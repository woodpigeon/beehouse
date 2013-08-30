
### Overview

. 

**beehouse** is a rough prototype web app for the [Bee Guardian Foundation](http://www.beeguardianfoundation.org) charity.

It built using Rails 3.2 and Ruby 1.9.3. 

Its uses the [Wicked](https://github.com/schneems/wicked) state machine gem, and [rails_admin](https://github.com/sferik/rails_admin) for admin functions and CMS.

It is intended to be deployed to [Heroku](http://www.heroku.com).

### Getting it running

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

```
bundle exec rake db:test:prepare
bundle exec rspec
```

### Deploying to Heroku



