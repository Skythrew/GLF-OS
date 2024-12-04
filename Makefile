# make without argument will perform a iso & install
all: iso install

# Test the configuration only
test:
	nixos-rebuild dry-build -I nixos-config=nix-cfg/configuration.nix

# Build new iso
iso:
	nix --extra-experimental-features "nix-command flakes" build .#iso

# Update flake.lock
update:
	nix --extra-experimental-features "nix-command flakes" flake update

# Clean local build
clean:
	@if [ -L "result" ]; then rm result; fi
	nix-collect-garbage

# Copy image and compute sha256sum
SRC_DIR = result/iso
DEST_DIR = iso
install:
	@IMG_FILE=$$(ls -t $(SRC_DIR) | tail -1); \
	if [ -n "$$IMG_FILE" ]; then \
		echo "Copying $$IMG_FILE ..."; \
		install -d $(DEST_DIR); \
		install "$(SRC_DIR)/$$IMG_FILE" $(DEST_DIR)/ && \
		cd $(DEST_DIR) && \
		sha256sum "$$IMG_FILE" > "$$IMG_FILE.sha256sum"; \
		cat "$$IMG_FILE.sha256sum"; \
	fi

.PHONY: all test clean iso update install