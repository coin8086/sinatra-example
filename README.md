[Sinatra + ActiveRecord = Really Lean Startup?](http://huiming.io/2016/10/15/sinatra-example.html)

# Sinatra Example
An example and start point for Sinatra with ActiveRecord and Capistrano. Production ready! Really lean yet full functional! You can start your application on it quickly!

Key points:

* Sinatra app with a config.ru that has URL mappings for multiple Rack classes.
* ActiveRecord in Sinatra: It includes example migration files, Rake tasks, test helpers and example test cases, and a Rails like console, all of which the sinatra/activerecord Gem itself doesn't provide. Here, the test helpers and examples are especially remarkable: they rely on neither Rails' Fixtures nor FactoryGirl, but something more intuitive and easy to use. Just take a look at the source!
* Capistrano deployment files: capistrano/rails/migrations doesn't work for Sinatra, so I made a custom migration task for ActiveRecord in Sinatra. Besides that, it also teaches you how to avoid checking your production config files into Git but provide them only at depoyment time.

To use it as a start point for your application, just use the source and get rid of what you don't want, say the db migration files, models, etc. You may also drop the Gemfile.lock and do a fresh new `bundle install` to install up to date Gems(and then don't forget to checkin the new Gemfile.lock).

The dir structure of the example is:

```
├── Capfile
├── config
│   ├── database.yml
│   ├── deploy
│   │   └── production.rb
│   └── deploy.rb
├── config.ru
├── db
│   ├── migrate
│   │   └── 20161015091414_create_users.rb
│   └── schema.rb
├── Gemfile
├── Gemfile.lock
├── init.rb
├── lib
│   ├── console.rb
│   └── models.rb
├── log
├── main.rb
├── public
├── Rakefile
├── README.md
├── script
│   └── serv
├── test
│   ├── lib
│   │   └── models_test.rb
│   ├── main_test.rb
│   └── test_helpers.rb
├── tmp
└── views
    ├── index.erb
    └── layout.erb
```

Common Tasks:

* Install Gems in Gemfile:
```
bundle install
```
* Start dev server on 0.0.0.0:4567 from app root dir:
```
./script/serv
```
* Create database with config in config/database.yml:
```
bundle exec rake db:create
```
* Create a migration file:
```
bundle exec rake db:create_migration NAME=your-migration-name
```
* Do database migration(s):
```
bundle exec rake db:migrate
```
* Rollback the recent one migration:
```
bundle exec rake db:rollback
```
* Run unit tests(the default Rake task):
```
bundle exec rake
```
* Enter interactive (Rails like) console:
```
bundle exec rake console
```
* List all Rake tasks:
```
bundle exec rake -T
```


Note that the backend database is PostgreSQL, but it's easy to swtich to MySQL. Just follow the instructions in comments in Gemfile.

