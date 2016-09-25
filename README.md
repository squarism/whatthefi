# What The Fi?!

> Wtf is up with my WiFi?

Really this is just an example of a more real-world CLI app using slop for a
blog post [here](http://squarism.com/2016/04/06/ruby-slop-example/).

```
# have ruby and bundler installed
bundle install

./witfi --ip               # shows your IP
./witfi --port=8080        # is your firewall blocking 8080?
./witfi --down=github.com  # is github down for just me or everyone?

./witfi -h                 # shows help and short options

# copy to your path if you think this is useful
# add bin to your path if you haven't already
mkdir ~/bin
path += ~/bin

cp ./witfi ~/bin
```

## Running tests

```
bundle exec rspec

CLI
Your IP is X.X.X.X
  lets you check your ip address
I can get to port 1234 on the Internet.  :)
  lets you see if you can hit a port on the internet
github.com seems up.  :)
  lets you see if a site is down for everyone

Finished in 1.59 seconds (files took 0.07376 seconds to load)
3 examples, 0 failures
```
