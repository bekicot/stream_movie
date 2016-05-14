require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'sinatra/directory_listing'

get '*' do |path|
   if File.exist?(File.join(settings.public_folder, path))
     if File.directory?(File.join(settings.public_folder, path))
       list()
     else
       send_file File.join(settings.public_folder, path)
     end
   else
     not_found
   end
end


def not_found
  'Not Found'
end

set :public_folder, File.dirname(__FILE__) + '/deluge'