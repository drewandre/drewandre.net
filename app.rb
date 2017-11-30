require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/reloader'
require 'sinatra/flash'
require 'sass/plugin/rack'

helpers do
  def img(category, name)
    title = File.basename(name,File.extname(name)).gsub(/[_-]/, ' ').split.map(&:capitalize).join(' ')
    return (
      "<div class='work-image'>
        <img class='work-tile' src='/images/#{category}/#{name}' alt='#{title}'/>
        <div id='work-text'><h4>#{title}</h4></div>
      </div>"
    )
  end

  def gather_images_from(folder)
    images = []
    Dir.foreach("public/images/#{folder}") do |file|
      next if file == '.' or file == '..'
      images.push(img(folder, file))
    end
    return images
  end
end

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
    @photos = gather_images_from('web')
  erb :work
end

get '/work/lighting' do
  @title = 'WORK';
  @subtitle = '(LIGHTING)';
  @photos = gather_images_from('lighting')
  erb :work
end

get '/work/web/palette' do
  @title = 'Palette';
  @photo = 'palette_photo_here'
  erb :work
end

get '/work/web/reporev' do
  @title = 'RepoRev';
  @photo = 'reporev_photo_here'
  erb :work
end

get '/work/lighting/aura' do
  @title = 'Aura';
  @photo = 'palette_photo_here'
  erb :work
end

get '/work/lighting/boston' do
  @title = 'Boston';
  @photo = 'palette_photo_here'
  erb :work
end

get '/work/lighting/tremont-street' do
  @title = 'Tremont Street';
  @photo = 'palette_photo_here'
  erb :work
end

get '/work/lighting/winchester' do
  @title = 'Winchester';
  @photo = 'palette_photo_here'
  erb :work
end

get '/*' do
  erb :index
end
