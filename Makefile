# make without argument will perform a test & clean
all: test clean

# Test the configuration only
test:
	nixos-rebuild dry-build -I nixos-config=nix-cfg/configuration.nix

# Clean local build
clean:
	@if [ -L "result" ]; then rm result; fi
	nix-collect-garbage

# Build new iso
iso:
	nix --extra-experimental-features "nix-command flakes" build .#iso

.PHONY: all test clean iso