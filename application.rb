# -*- coding: utf-8 -*-

class Application < Sinatra::Base
  configure do
    set :sprockets, Sprockets::Environment.new
    Sprockets::Helpers.configure do |config|
      config.environment = sprockets
      config.prefix = '/assets'
      config.digest = true
    end
    sprockets.append_path 'assets/javascripts'
    sprockets.append_path 'assets/stylesheets'
    sprockets.append_path 'assets/images'

    sprockets.append_path 'vender/javascripts'
    sprockets.append_path 'vender/stylesheets'

    sprockets.js_compressor = Closure::Compiler.new(
      :compilation_level => 'SIMPLE_OPTIMIZATIONS'
    )
  end
  helpers Sprockets::Helpers

  get '/' do
    haml :index
  end
  error 404 do
    haml :'404'
  end
end
