# Sinatra Example
An example and start point for Sinatra with ActiveRecord and Capistrano. Production ready! Really lean yet full functional! You can start your application on it quickly!

Key points:

* Sinatra app with a config.ru that has URL mappings for multiple Rack classes.
* ActiveRecord in Sinatra: It includes Rake tasks, test helpers and example test cases, and a Rails like console for ActiveRecord in Sinatra, all of which the sinatra/activerecord Gem itself doesn't provide. It's especially helpful to have the test helpers and examples.
* Capistrano deployment files: capistrano/rails/migrations doesn't work for Sinatra, so I made a custom migration task for Sinatra/ActiveRecord. Besides that, it also teach you how to avoid checking your production config files into Git but to link them at depoyment time.

The backend database is PostgreSQL, but it's easy to swtich to MySQL. Just follow the instructions in comments in Gemfile.

To use it as a start point for your application, just use the source and get rid of what you don't want, say the db migration files, models, etc. You may also drop the Gemfile.lock and do a fresh new `bundle install` to have an up to date Gemfile.lock.

The dir structure of the example is:

```
.
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
```
