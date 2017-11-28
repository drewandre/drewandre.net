require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/reloader'
require 'sinatra/flash'
require 'sass/plugin/rack'

enable :sessions

set :bind, '0.0.0.0' # bind to all interfaces

configure :development, :test do
  require 'pry'
end

configure do
  ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')
  Sass::Plugin.options[:style] = :compressed
  use Sass::Plugin::Rack
  set :views, 'app/views'
end

Dir[File.join(File.dirname(__FILE__), 'app', '**', '*.rb')].each do |file|
  require file
  also_reload file
end

get '/' do
  erb :index
end

get '/about' do
  erb :about
end

get '/contact' do
  erb :contact
end

get '/store' do
  erb :store
end

get '/custom-installs' do
  erb :custom_installs
end

get '/work/web' do
    @title = 'Web';
    @photo = 'palette_photo_here'
  erb :web_work
end

get '/work/lighting' do
  @title = 'Lighting';
  @photo = 'palette_photo_here'
  erb :lighting_work
end

get '/work/web/palette' do
  @title = 'Palette';
  @photo = 'palette_photo_here'
  erb :web_work
end

get '/work/web/reporev' do
  @title = 'RepoRev';
  @photo = 'reporev_photo_here'
  erb :web_work
end

get '/work/lighting/aura' do
  @title = 'Aura';
  @photo = 'palette_photo_here'
  erb :lighting_work
end

get '/work/lighting/boston' do
  @title = 'Boston';
  @photo = 'palette_photo_here'
  erb :lighting_work
end

get '/work/lighting/tremont-street' do
  @title = 'Tremont Street';
  @photo = 'palette_photo_here'
  erb :lighting_work
end

get '/work/lighting/winchester' do
  @title = 'Winchester';
  @photo = 'palette_photo_here'
  erb :lighting_work
end

get '/*' do
  erb :index
end
