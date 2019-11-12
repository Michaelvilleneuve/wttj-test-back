require 'sinatra'
require 'sinatra-websocket'
require 'active_mappers'

Dir["./lib/**/*.rb"].each {|file| require file }

set :server, 'thin'
set :sockets, []
set :offer, Seed.process

get '/' do
  request.websocket do |ws|
    ws.onopen do
      ws.send(settings.offer.render)
      settings.sockets << ws
    end

    ws.onmessage do |params|
      Router.new({ offer: settings.offer }.merge(params)).handle
      EM.next_tick { settings.sockets.each{|s| s.send(settings.offer.render) } }
    end
    
    ws.onclose { settings.sockets.delete(ws) }
  end
end

