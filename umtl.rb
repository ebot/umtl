#!/usr/bin/env ruby
require 'sinatra'
require 'open-uri'
require 'Nokogiri'

# index
get '/' do
  haml :index
end

# search
get '/search' do
  search = params['search'].gsub(' ', '%20')
  @doc = Nokogiri::HTML( open( 'http://spica.mclinc.org/polaris/search/searchresults.aspx' <<
                               '?ctx=15.1033.0.0.2&ctrlSearchBars:searchbarKeyword:textboxTerm=' <<
                               search ) )
  haml :search
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