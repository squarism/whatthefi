require "./spec_helper"

require "../src/cli"

Spec2.describe CLI do

  # multiple nested contexts and describes don't quite work like rspec
  # so these tests are structured pretty flat with it-s
  describe "when arguments come from the command line" do

    it "has a mode for checking your public IP address" do
      # This is how we can capture stdout streams.
      # This is better than changing the code to output a string
      # and making a class that prints the return statement.
      # The task class can be free to do what it wants.
      output = nil
      Stdio.capture do |io|
        CLI.run(%w(--ip))
        output = io.out.gets
      end

      expect(output).to match(/Your IP is/)
    end

    # this test has some weird terminal sequence from trying to capture
    # stdout.  So that's not great.  So let's just match instead of trying to match exact.
    it "has a mode for checking if a port is accessible" do
      output = nil
      Stdio.capture do |io|
        CLI.run(%w(--port 80))
        output = io.out.gets
      end

      expect(output).to match(/can get/)
    end

    it "checks a site on --down" do
      output = nil
      Stdio.capture do |io|
        CLI.run(%w(--down http://google.com))
        output = io.out.gets
      end

      expect(output).to match(/seems up/)
    end

    # The problem with doing these tests is that the CLI exits on help output.
    # So the test suite will exit early because --help is really an exit from the Cli shard.
    # So we have to run this as a shell and get the output.
    # Note that IO::Memory used to be MemoryIO in older versions of crystal.
    it "outputs help on no arguments" do
      command = "crystal run src/main.cr --"  # this passes no arguments with --
      io = IO::Memory.new
      Process.run(command, shell: true, output: io)
      output = io.to_s

      expect(output).to match(/[OPTIONS]/)
    end

    it "outputs help on help" do
      command = "crystal run src/main.cr -- -h"
      io = IO::Memory.new
      Process.run(command, shell: true, output: io)
      output = io.to_s

      expect(output).to match(/[OPTIONS]/)
    end

    it "outputs the version" do
      command = "crystal run src/main.cr -- -v"
      io = IO::Memory.new
      Process.run(command, shell: true, output: io)
      output = io.to_s

      expect(output).to match(/#{CLI::VERSION}/)
    end

  end
end
