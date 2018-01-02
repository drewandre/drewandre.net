require 'rubygems'
require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/reloader'
require 'sinatra/flash'
require 'sass/plugin/rack'
require 'action_mailer'
require 'httparty'
require 'json'
require_relative 'app/helpers/helpers.rb'

begin
  require './env' if File.exists?('env.rb')
rescue LoadError
  puts "Couldn't find env file"
end

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
     :user_name      => ENV["GMAIL_USERNAME"],
     :password       => ENV["GMAIL_PASSWORD"],
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

get '/about' do
  @GITHUB_OAUTH = ENV["GITHUB_OAUTH"]
  @skills_yml = YAML::load_file "public/about/skills.yml"
  @learning_yml = YAML::load_file "public/about/learning.yml"
  @skills_section = create_about_section(@skills_yml)
  @learning_section = create_about_section(@learning_yml)
  erb :about
end

get '/contact' do
  erb :contact
end

post '/contact' do
  @from_email = params[:from_email]
  @location = params[:location]
  @comments = params[:comments]
  @name = params[:name]
  @me = ENV["GMAIL_USERNAME"]
  auto_reply = Mailer.auto_reply(@from_email, @name)
  email_to_me = Mailer.email_to_me(@from_email, @comments, @name, @location)
  auto_reply.deliver
  email_to_me.deliver
  flash[:success] = "Thanks for the email #{@name.split.first}! Give me 48 hours and I'll get back to you."
  redirect '/contact'
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
  @tools = YAML::load_file "public/projects/web/palette/tools.yml"
  @tools = create_tools_icons(@tools, "show")
  if @description['vimeo_urls']
    @vimeo_videos = create_vimeo_iframes(@description)
  end
  @photos = gather_all_media_from('web/palette')
  erb :"work/show"
end

get '/work/web/palmos' do
  @title = 'Palmos';
  @subtitle = 'Environmental sensor data';
  @description = YAML::load_file "public/projects/web/palmos/description.yml"
  @tools = YAML::load_file "public/projects/web/palmos/tools.yml"
  @tools = create_tools_icons(@tools, "show")
  if @description['vimeo_urls']
    @vimeo_videos = create_vimeo_iframes(@description)
  end
  @photos = gather_all_media_from('web/palmos')
  erb :"work/show"
end

get '/work/web/reporev' do
  @title = 'RepoRev';
  @subtitle = 'GitHub Repo Search';
  @description = YAML::load_file "public/projects/web/reporev/description.yml"
  @tools = YAML::load_file "public/projects/web/reporev/tools.yml"
  @tools = create_tools_icons(@tools, "show")
  if @description['vimeo_urls']
    @vimeo_videos = create_vimeo_iframes(@description)
  end
  @photos = gather_all_media_from('web/reporev')
  erb :"work/show"
end

get '/work/web/portfolio' do
  @title = 'drew-andre.com';
  @subtitle = 'Portfolio';
  @description = YAML::load_file "public/projects/web/portfolio/description.yml"
  @tools = YAML::load_file "public/projects/web/portfolio/tools.yml"
  @tools = create_tools_icons(@tools, "show")
  if @description['vimeo_urls']
    @vimeo_videos = create_vimeo_iframes(@description)
  end
  @photos = gather_all_media_from('web/portfolio')
  erb :"work/show"
end

get '/work/lighting/aura' do
  @title = 'Aura';
  @subtitle = 'Smart LED controller';
  @description = YAML::load_file "public/projects/lighting/aura/description.yml"
  @tools = YAML::load_file "public/projects/lighting/aura/tools.yml"
  @tools = create_tools_icons(@tools, "show")
  if @description['vimeo_urls']
    @vimeo_videos = create_vimeo_iframes(@description)
  end
  @photos = gather_all_media_from('lighting/aura')
  erb :"work/show"
end

get '/work/lighting/boston' do
  @title = 'Boston';
  @subtitle = 'LED Drum Kit';
  @description = YAML::load_file "public/projects/lighting/boston/description.yml"
  @tools = YAML::load_file "public/projects/lighting/boston/tools.yml"
  @tools = create_tools_icons(@tools, "show")
  if @description['vimeo_urls']
    @vimeo_videos = create_vimeo_iframes(@description)
  end
  @photos = gather_all_media_from('lighting/boston')
  erb :"work/show"
end

get '/work/lighting/tremont' do
  @title = 'Tremont Street';
  @subtitle = 'Reactive apartment lighting';
  @description = YAML::load_file "public/projects/lighting/tremont/description.yml"
  @tools = YAML::load_file "public/projects/lighting/tremont/tools.yml"
  @tools = create_tools_icons(@tools, "show")
  if @description['vimeo_urls']
    @vimeo_videos = create_vimeo_iframes(@description)
  end
  @photos = gather_all_media_from('lighting/tremont')
  erb :"work/show"
end

get '/work/lighting/winchester' do
  @title = 'Winchester';
  @subtitle = 'Reactive dorm lighting';
  @description = YAML::load_file "public/projects/lighting/winchester/description.yml"
  @tools = YAML::load_file "public/projects/lighting/winchester/tools.yml"
  @tools = create_tools_icons(@tools, "show")
  if @description['vimeo_urls']
    @vimeo_videos = create_vimeo_iframes(@description)
  end
  @photos = gather_all_media_from('lighting/winchester')
  erb :"work/show"
end

get '/*' do
  erb :index
end
