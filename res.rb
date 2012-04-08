# res.rb
require 'zmq'

context = ZMQ::Context.new
socket = context.socket ZMQ::REP
socket.bind 'tcp://*:5557'

trap("INT") { socket.close }

begin
  while line = socket.recv
    puts line
    socket.send(line)
  end
rescue ZMQ::Error => e
  puts "Shutting down: #{e.message}" 
end

