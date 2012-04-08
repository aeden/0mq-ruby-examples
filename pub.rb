# pub.rb
require 'zmq'

context = ZMQ::Context.new
pub     = context.socket ZMQ::PUB
pub.bind 'tcp://*:5555'

trap("INT") { pub.close }

while line = STDIN.gets
  chan, msg = line.split ' ', 2
  msg.strip!
  pub.send "#{chan} #{msg}"
end
