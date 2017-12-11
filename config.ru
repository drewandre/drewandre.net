require './app'
require './env' if File.exists?('env.rb')
run Sinatra::Application
