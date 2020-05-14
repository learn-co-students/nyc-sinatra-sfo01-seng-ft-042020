class ApplicationController < Sinatra::Base
  set :views, proc { File.join(root, '../views/') }
  register Sinatra::Twitter::Bootstrap::Assets
  require_relative 'landmarks_controller'
  require_relative 'figures_controller'

  get '/' do
    erb :"application/index"
  end
end
