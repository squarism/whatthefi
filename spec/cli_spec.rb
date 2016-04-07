# use load instead of require because I'm intentionally leaving off the
# rb file extension for a script style command
load File.expand_path(File.join(File.dirname(__FILE__), '../whatthefi'))

describe CLI do

  it "lets you check your ip address" do
    expect {
      CLI.new.main ["--ip"]
    }.not_to raise_error
  end

  it "lets you see if you can hit a port on the internet" do
    expect {
      CLI.new.main ["--port=1234"]
    }.not_to raise_error
  end

  it "lets you see if a site is down for everyone" do
    expect {
      CLI.new.main ["--down=github.com"]
    }.not_to raise_error
  end

end
