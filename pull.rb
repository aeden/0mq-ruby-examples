# pull.rb
require 'zmq'

context = ZMQ::Context.new
pull = context.socket ZMQ::PULL
pull.bind 'tcp://*:5555'

trap("INT") { pull.close }

begin
  while line = pull.recv
    puts line
  end
rescue ZMQ::Error => e
  puts "Shutting down: #{e.message}" 
end
