# Tubes

An example of a CLI app using slop for a blog post [here](https://squarism.com/2016-04-06-ruby-slop-example).

```
# have ruby and bundler installed
bundle install

./tubes --ip               # shows your IP
./tubes --port=8080        # show if you can hit :8080 on the internet (test for firewall blocking)
./tubes --down=github.com  # is github down for just me or everyone?

./tubes -h                 # shows help and short options

# copy to your path if you think this is useful
# add bin to your path if you haven't already
mkdir ~/bin
path += ~/bin

cp ./tubes ~/bin
```

## Running tests

```
bundle exec rspec

CLI
Your IP is 73.25.238.173
  lets you check your ip address
I can get to port 1234 on the Internet.  :)
  lets you see if you can hit a port on the internet
github.com seems up.  :)
  lets you see if a site is down for everyone

Finished in 1.59 seconds (files took 0.07376 seconds to load)
3 examples, 0 failures
```
