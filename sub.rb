# sub.rb
require 'zmq'

context = ZMQ::Context.new
chans   = ARGV 
sub     = context.socket ZMQ::SUB

sub.connect 'tcp://127.0.0.1:5555'
chans.each { |ch| sub.setsockopt ZMQ::SUBSCRIBE, ch }

trap("INT") { context.close }

while line = sub.recv
  chan, user, msg = line.split ' ', 3
  puts "##{chan} [#{user}]: #{msg}"
end
