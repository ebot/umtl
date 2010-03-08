#!/usr/bin/env ruby
require 'sinatra'

# iphone index
get '/', :agent => /Mobile|webOS/ do
  haml :iphone, :layout => false
end

# index
get '/' do
  haml :index
end

# search
get '/search' do
  search = params['search'].gsub(' ', '%20')
  redirect 'http://spica.mclinc.org/polaris/search/searchresults.aspx' <<
           '?ctx=15.1033.0.0.2&term=' <<
           search
end

# SASS stylesheets
get '/stylesheets/grid.css' do
  header 'Content-Type' => 'text/css; charset=utf-8'
  sass :grid
end

get '/stylesheets/application.css' do
  header 'Content-Type' => 'text/css; charset=utf-8'
  sass :application
end

get '/stylesheets/iphone.css' do
  header 'Content-Type' => 'text/css; charset=utf-8'
  sass :iphone
end