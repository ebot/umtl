#!/usr/bin/env ruby -wKU

require 'sinatra'

# index
get '/' do
  haml :index
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