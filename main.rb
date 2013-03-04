require 'rubygems'
require 'sinatra'
require 'haml'
require 'pony'
require 'rack/cache'
require 'coffee-script'

configure :production do
  require 'newrelic_rpm'
end

#set better errors for testing
if ENV['RACK_ENV'] != 'production'
  require "better_errors"
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path("..", __FILE__)
end

set :haml, :format => :html5

configure do
  use Rack::Deflater
  use Rack::Cache
  set :static_cache_control, [:public, :max_age => 760000]
end


helpers do
  def sprite_tag(name)
    image_tag('s.gif', :class => name)
  end
end

get '/' do
  cache_control :public, :max_age => 36000
  haml :index
end

post '/' do
  name = params[:name]
  mail = params[:mail]
  body = params[:body]
  Pony.mail(
    :from => name + "<" + mail + ">",
    :to => 'friedmanj98@gmail.com',
    :subject => params[:name] + " has contacted you",
    :body => params[:body],
    :port => '587',
    :via => :smtp,
    :via_options => {
      :address              => 'smtp.sendgrid.net',
      :port                 => '587',
      :enable_starttls_auto => true,
      :user_name            => ENV['SENDGRID_USERNAME'],
      :password             => ENV['SENDGRID_PASSWORD'],
      :authentication       => :plain,
      :domain               => ENV['SENDGRID_DOMAIN']
      })
  haml :index
end

get '/js/scripts.js' do
  coffee :scripts
end