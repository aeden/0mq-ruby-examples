# 0mq from Ruby

A few examples of using 0mq from Ruby via the zmq library.

## Starting

    gem install bundler
    bundle install

## Request/Response Example

In separate consoles:

```ruby req.rb```
```ruby res.rb```

In the req.rb console, type something and that will be printed in res.rb and then echoed on req.rb.

## Push/Pull Example

In separate consoles:

```ruby push.rb```
```ruby pull.rb```

In the push.rb console, type something and that will be printed in pull.rb.

## Pub/Sub Example

In separate consoles:

```ruby pub.rb```
```ruby sub.rb chan1```
```ruby sub.rb chan2```
```ruby sub.rb chan1 chan2```

Then in the pub.rb type "chan1 hello", this should appear on any sub.rb hooked up to chan1. Type "chan2 world" and that should appear on any sub.rb hooked up to chan2.
