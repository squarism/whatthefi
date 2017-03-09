# What the Wi ?!

Wtf is up with my WiFi?  _(really a blog post example about porting Ruby to Crystal)_

## Install

```
brew tap squarism/tap
brew install whatthefi
```


## Usage

```
$ whatthefi -h
whatthefi [OPTIONS]

Options:
  --down URL     is this website down for just me?
  --ip           what is my IP?
  --port PORT    test a port outgoing to the Internet
  -h, --help     show this help
  -v, --version  show version
  
  
$ whatthefi --down google.com
google.com seems up according to people.

$ whatthefi --port 1024
I can get to port 1024 on the Internet.  :)

$ whatthefi --ip
Your IP is 1.1.1.1
```
