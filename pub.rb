# pub.rb
require 'zmq'

context = ZMQ::Context.new
chan    = ARGV[0]
user    = ARGV[1]
pub     = context.socket ZMQ::PUB
pub.bind 'tcp://*:5555'

trap("INT") { context.close }

while msg = STDIN.gets
  msg.strip!
  pub.send "#{chan} #{user} #{msg}"
end
