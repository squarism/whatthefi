require "cli"
require "http/client"
require "json"

class CLI < Cli::Command
  VERSION = "0.2.0"

  command_name "whatthefi"
  version VERSION

  class Options
    # the program's flags
    bool "--ip", desc: "what is my IP?", default: false
    string "--port", var: "PORT", desc: "test a port outgoing to the Internet"
    string "--down", var: "URL", desc: "is this website down for just me?"

    # enable the built-in features of Cli
    version
    help
  end

  # I tried to use the on.foo { } style callbacks but then you lose access to the options variable.
  def run
    if options.ip?
      puts what_is_my_ip
    elsif options.port?
      puts check_port(options.port)
    elsif options.down?
      site_is_down = is_it_down(options.down)
      if site_is_down
        puts "#{options.down} seems down according to people."
      else
        puts "#{options.down} seems up according to people."
      end
    else
      # no options were passed
      help!
    end
  end

  def http_get(url)
    HTTP::Client.get(url)
  end

  # outside of scope but you can see these are action methods here
  # these could easily be broken out to classes
  def what_is_my_ip
    ip_status_url = "https://httpbin.org/ip"
    response = http_get(ip_status_url)
    begin
      origin = JSON.parse(response.body)["origin"]
      "Your IP is #{origin}"
    rescue ex : Socket::Error
      puts "Network problem connecting to #{ip_status_url}"  # TODO: not great, ex.inspect is a huge stacktrace
      exit!
    end
  end

  def check_port(port)
    begin
      response = http_get("http://portquiz.net:#{port}")
    rescue ArgumentError
      # TODO: how else can I handle extra args?
    end

    if response
      "I can get to port #{port} on the Internet.  :)"
    else
      "I cannot reach port #{port} on the Internet.  :("
    end
  end

  def is_it_down(url)
    response = http_get("http://www.downforeveryoneorjustme.com/#{url}")

    if html_match = response.body.match(/class="domain"\>.*\<\/a\>(.*)\./)
      return true if html_match[0].includes?("looks down")
      return false if html_match[0].includes?("is up")
    else
      # TODO: this is crap.  Status loss.  Can't return nil for same reason.  Create an error class to represent this.
      return false
    end
  end

end
