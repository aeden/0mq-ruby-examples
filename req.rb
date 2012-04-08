# req.rb
require 'zmq'

context = ZMQ::Context.new
socket = context.socket ZMQ::REQ
socket.connect 'tcp://127.0.0.1:5557'

Signal.trap(:INT) { socket.close }

begin
  while msg = STDIN.gets
    msg.strip!
    socket.send msg
    response = socket.recv
    p "echo:#{response}"
  end
rescue IOError => e
  puts "Shutting down: #{e.message}" 
end
