all: bin

test:
	crystal spec

bin: clean
	crystal build -s --release -o whatthefi src/main.cr

clean:
	rm -f whatthefi

run:
	crystal run src/whatthefi.cr

# Really not much point in doing this with this particular utility
zsh:
	crystal eval 'require "./src/cli.cr"; puts CLI.generate_zsh_completion'
