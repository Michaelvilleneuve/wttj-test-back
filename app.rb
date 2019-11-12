require 'sinatra'
require 'sinatra-websocket'

Dir["./lib/*.rb"].each {|file| require file }

set :server, 'thin'
set :sockets, []

offer = Seed.process

get '/' do
  request.websocket do |ws|
    ws.onopen do
      ws.send(offer.to_json)
      settings.sockets << ws
    end

    ws.onmessage do |msg|
      EM.next_tick { settings.sockets.each{|s| s.send(msg) } }
    end
    
    ws.onclose { settings.sockets.delete(ws) }
  end
end

