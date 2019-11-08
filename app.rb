require 'sinatra'
require 'sinatra-websocket'

set :server, 'thin'
set :sockets, []

get '/' do
  request.websocket do |ws|
    ws.onopen do
      ws.send("coucou")
      settings.sockets << ws
    end

    ws.onmessage do |msg|
      EM.next_tick { settings.sockets.each{|s| s.send(msg) } }
    end
    
    ws.onclose { settings.sockets.delete(ws) }
  end
end

