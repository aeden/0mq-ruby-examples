# push.rb
require 'zmq'

context = ZMQ::Context.new
push = context.socket ZMQ::PUSH
push.connect 'tcp://127.0.0.1:5555'

Signal.trap(:INT) { push.close }

begin
  while msg = STDIN.gets
    msg.strip!
    push.send msg
  end
rescue IOError => e
  puts "Shutting down: #{e.message}" 
end
