require 'rubygems'
require 'sinatra'
require 'haml'
require "better_errors"

set :haml, :format => :html5

use BetterErrors::Middleware
BetterErrors.application_root = File.expand_path("..", __FILE__)

get '/' do
  haml :index
end