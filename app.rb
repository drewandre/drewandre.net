require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/reloader'
require 'sinatra/flash'
require 'sass/plugin/rack'
require 'action_mailer'
require_relative 'app/helpers/helpers.rb'

enable :sessions

set :bind, '0.0.0.0' # bind to all interfaces

configure :development, :test do
  require 'pry'
end

configure do
  ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')

  ActionMailer::Base.raise_delivery_errors = true
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
     :address        => "smtp.gmail.com",
     :port           => 587,
     :domain         => "example.com",
     :authentication => :plain,
     :user_name      => "drewjamesandre@gmail.com",
     :password       => "Hobbes1990",
     :enable_starttls_auto => true
    }
  ActionMailer::Base.view_paths = File.expand_path('../app/views/', __FILE__)

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

get '/thank-you' do
  erb :thank_you
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

post '/custom-installs' do
  @from_email = params[:from_email];
  @comments = params[:comments];
  @name = params[:name];
  email = Mailer.notification(@from_email, @comments, @name)
  email.deliver
  flash[:success] = "Thanks for the email #{@name.split.first}! Give me 48 hours and I'll get back to you!"
  redirect '/'
end

get '/work/web' do
    @title = 'WORK';
    @subtitle = '(WEB)';
    @photos = gather_top_images_from('web')
  erb :"work/index"
end

get '/work/lighting' do
  @title = 'WORK';
  @subtitle = '(LIGHTING)';
  @photos = gather_top_images_from('lighting')
  erb :"work/index"
end

get '/work/web/palette' do
  @title = 'Palette';
  @subtitle = 'Smart LED controller';
  @description = YAML::load_file "public/projects/web/palette/description.yml"
  @tools = create_tools_icons(@description, "show")
  @photos = gather_all_media_from('web/palette')
  erb :"work/show"
end

get '/work/web/reporev' do
  @title = 'RepoRev';
  @subtitle = 'GitHub Repo Search';
  @description = YAML::load_file "public/projects/web/reporev/description.yml"
  @tools = create_tools_icons(@description, "show")
  @photos = gather_all_media_from('web/reporev')
  erb :"work/show"
end

get '/work/web/portfolio' do
  @title = 'drew-andre.com';
  @subtitle = 'Portfolio';
  @description = YAML::load_file "public/projects/web/portfolio/description.yml"
  @tools = create_tools_icons(@description, "show")
  @photos = gather_all_media_from('web/portfolio')
  erb :"work/show"
end

get '/work/lighting/aura' do
  @title = 'Aura';
  @subtitle = 'Smart LED controller';
  @description = YAML::load_file "public/projects/lighting/aura/description.yml"
  @tools = create_tools_icons(@description, "show")
  @photos = gather_all_media_from('lighting/aura')
  erb :"work/show"
end

get '/work/lighting/boston' do
  @title = 'Boston';
  @subtitle = 'LED Drum Kit';
  @description = YAML::load_file "public/projects/lighting/boston/description.yml"
  @tools = create_tools_icons(@description, "show")
  @photos = gather_all_media_from('lighting/boston')
  erb :"work/show"
end

get '/work/lighting/tremont' do
  @title = 'Tremont Street';
  @subtitle = 'Reactive apartment lighting';
  @description = YAML::load_file "public/projects/lighting/tremont/description.yml"
  @tools = create_tools_icons(@description, "show")
  @photos = gather_all_media_from('lighting/tremont')
  erb :"work/show"
end

get '/work/lighting/winchester' do
  @title = 'Winchester';
  @subtitle = 'Reactive dorm lighting';
  @description = YAML::load_file "public/projects/lighting/winchester/description.yml"
  @tools = create_tools_icons(@description, "show")
  @photos = gather_all_media_from('lighting/winchester')
  erb :"work/show"
end

get '/*' do
  erb :index
end
