# config valid only for current version of Capistrano
lock '3.3.5'

set :application, 'sinatra-example'

# If you changed the repo_url after a successful deployment, you would have to
# edit the file "#{deploy_to}/repo/config" in target servers manually.
set :repo_url, 'username@server-name:/path/to/sinatra-example.git'

# Default branch is :master
ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "~/#{fetch :application}"

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 3

###########################################################
# Options from 'capistrano/bundler'
#
# bundle_flags default to "--deployment --quiet", which means to install Gems in
# vendor/cache(by "bundler package" command) to bundle_path(default to shared/bundle).
# To install Gems to usual place(that is under .rvm), set it to nil(may also need
# to set bundle_path to nil).
# set :bundle_flags, nil

# Do not install these Gems on target servers
set :bundle_without, (fetch(:bundle_without) << ' deployment')

namespace :deploy do

  # Do not put your production config files under the config dir and check them into
  # a code repo like Git. Instead, put them in a dir somewhere else on the server
  # and link the dir at depoyment time.
  before :updated, :link_config_dir do
    on roles(:app, :db), in: :parallel do
      within release_path do
        execute :rm, '-rf', 'config'
        execute :ln, '-s', '/etc/sinatra-example-prd', 'config'
      end
    end
  end

  # NOTE: You should do migration only on one server. So here we do it in sequence so
  # that only one server really gets the work done.
  after :updated, :migrate do
    on roles(:db), in: :sequence, wait: 15 do
      within release_path do
        with rack_env: fetch(:stage) do
          execute :rake, 'db:migrate'
        end
      end
    end
  end

  before :finished, :restart_server do
    on roles(:app), in: :parallel do
      within release_path.join('tmp') do
        execute :touch, 'restart.txt'
      end
    end
  end

end

