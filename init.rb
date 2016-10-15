require 'rubygems'
require 'bundler'

ENV['RACK_ENV'] ||= 'development'
Bundler.setup(:default, ENV['RACK_ENV'])

APP_ROOT = File.absolute_path(File.dirname(__FILE__))
LIB_DIR = File.join(APP_ROOT, 'lib')
LOG_DIR = File.join(APP_ROOT, 'log')
TMP_DIR = File.join(APP_ROOT, 'tmp')

# This must be named "config" and be under the APP_ROOT, otherwise
# sinatra/activerecord can't find it.
CFG_DIR = File.join(APP_ROOT, 'config')

$:.unshift LIB_DIR

