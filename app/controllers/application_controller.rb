require 'rack-flash'
class ApplicationController < Sinatra::Base

  set :views, Proc.new { File.join(root, "../views/") }
  register Sinatra::Twitter::Bootstrap::Assets
  enable :sessions
  use Rack::Flash
  use Rack::MethodOverride
  set :session_secret, "my_application_secret"
end
