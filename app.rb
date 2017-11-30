require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/reloader'
require 'sinatra/flash'
require 'sass/plugin/rack'
require_relative 'app/helpers/helpers.rb'

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
    @title = 'WORK';
    @subtitle = '(WEB)';
    @photos = gather_top_images_from('web')
  erb :work
end

get '/work/lighting' do
  @title = 'WORK';
  @subtitle = '(LIGHTING)';
  @photos = gather_top_images_from('lighting')
  erb :work
end

get '/work/web/palette' do
  @title = 'Palette';
  @subtitle = 'Smart LED controller';
  @photos = gather_all_images_from('web/palette')
  erb :work
end

get '/work/web/reporev' do
  @title = 'RepoRev';
  @subtitle = 'GitHub Repo Search';
  @photos = gather_all_images_from('web/reporev')
  erb :work
end

get '/work/web/portfolio' do
  @title = 'drew-andre.com';
  @subtitle = 'Portfolio';
  @photos = gather_all_images_from('web/portfolio')
  erb :work
end

get '/work/lighting/aura' do
  @title = 'Aura';
  @subtitle = 'Smart LED controller';
  @photos = gather_all_images_from('lighting/aura')
  erb :work
end

get '/work/lighting/boston' do
  @title = 'Boston';
  @subtitle = 'LED Drum Kit';
  @photos = gather_all_images_from('lighting/boston')
  erb :work
end

get '/work/lighting/tremont' do
  @title = 'Tremont Street';
  @subtitle = 'Reactive suite lighting';
  @photos = gather_all_images_from('lighting/tremont_street')
  erb :work
end

get '/work/lighting/winchester' do
  @title = 'Winchester';
  @subtitle = 'Reactive dorm room lighting';
  @photos = gather_all_images_from('lighting/winchester')
  erb :work
end

get '/*' do
  erb :index
end
