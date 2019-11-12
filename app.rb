require 'sinatra'
require 'sinatra-websocket'
require 'active_mappers'

Dir["./lib/**/*.rb"].each {|file| require file }

set :server, 'thin'
set :sockets, []

offer = Seed.process

get '/' do
  request.websocket do |ws|
    ws.onopen do
      ws.send(JobOfferMapper.with(offer))
      settings.sockets << ws
    end

    ws.onmessage do |msg|
      EM.next_tick { settings.sockets.each{|s| s.send(JobOfferMapper.with(offer)) } }
    end
    
    ws.onclose { settings.sockets.delete(ws) }
  end
end

