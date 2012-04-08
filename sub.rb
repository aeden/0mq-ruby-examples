# sub.rb
require 'zmq'

context = ZMQ::Context.new
chans   = ARGV 
sub     = context.socket ZMQ::SUB

sub.connect 'tcp://127.0.0.1:5555'
chans.each { |ch| sub.setsockopt ZMQ::SUBSCRIBE, ch }

trap("INT") { sub.close }

while line = sub.recv
  chan, msg = line.split ' ', 2
  puts "[#{chan}] #{msg}"
end
