require 'rubygems'
require 'sinatra'
require 'haml'

#set better errors for testing
if ENV['RACK_ENV'] != 'production'
  require "better_errors"
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path("..", __FILE__)
end

set :haml, :format => :html5

helpers do
  sprite_tag(name)
    image_tag('s.gif', :class => name)
  end
end

get '/' do
  haml :index
end