class ApplicationController < Sinatra::Base
  enable :sessions
  set :views, Proc.new { File.join(root, "../views/") }
  register Sinatra::Twitter::Bootstrap::Assets
end
