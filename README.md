# Nix Configuration for Multiple Hosts

This flake manages dotfiles and development environment across multiple hosts using Home Manager.

## Hosts

| Hostname | System | Description |
|----------|--------|-------------|
| `linux-ssh` | aarch64-linux | Headless Linux machine (SSH only) |
| `mac` | aarch64-darwin | macOS (Mac Mini + MacBook) |

## Directory Structure

```
nix/
├── flake.nix              # Main entry point
├── README.md              # This file
├── hosts/                 # Host-specific configurations
│   ├── template.nix       # Template for new hosts
│   ├── linux-ssh.nix      # Linux configuration
│   └── mac.nix            # macOS configuration
└── home/                  # Home Manager modules
    ├── default.nix        # Base home configuration
    ├── packages/          # Package definitions
    │   ├── shared.nix     # Packages for all systems
    │   ├── linux.nix      # Linux-only packages
    │   └── darwin.nix     # macOS-only packages
    ├── shell/             # Shell configuration
    │   ├── default.nix    # Shell module
    │   ├── .zshrc.linux   # Linux zshrc
    │   └── .zshrc.mac     # macOS zshrc
    ├── starship/          # Starship prompt
    ├── nvim/              # Neovim configuration
    └── lazygit/           # Lazygit configuration
```

## Usage

### Apply Configuration to a Host

```bash
# Apply Linux configuration
nix run home-manager/master -- switch --flake '.#linux-ssh'
home-manager switch --flake '.#linux-ssh'

# Apply macOS configuration
nix run home-manager/master -- switch --flake '.#mac'
home-manager switch --flake '.#mac'
```

**Note:** After running `home-manager switch`, you must manually copy the Git configuration:
```bash
cp home/git/.gitconfig ~/.gitconfig
```

### Check Configuration Without Applying

```bash
# Build configuration without activating
nix build .#homeConfigurations.<hostname>.activationPackage
./result/activate
```

### View Available Hosts

```bash
nix flake show
```

## Adding a New Host

1. Copy the template:
   ```bash
   cp hosts/template.nix hosts/new-hostname.nix
   ```

2. Edit `hosts/new-hostname.nix`:
   - Set `home.homeDirectory` to the full path (e.g., "/home/username")
   - Add any host-specific imports:
     - For macOS: `../home/packages/darwin.nix`
     - For Linux: `../home/packages/linux.nix` (optional, currently empty)
   - Add any host-specific configurations

3. Add the new host to `flake.nix` in the `configs` let binding

4. Apply the configuration:
   ```bash
   nix run home-manager/master -- switch --flake .#new-hostname
   ```

## Package Management

Packages are organized by platform:

- **Shared** (`home/packages/shared.nix`): Available on all systems
- **Linux** (`home/packages/linux.nix`): Linux-only packages
- **Darwin** (`home/packages/darwin.nix`): macOS-only packages

To add a package, edit the appropriate file.

## Shell Configuration

The shell module selects the correct `.zshrc` based on hostname:
- `mac` → `.zshrc.mac`
- Any other hostname → `.zshrc.linux`

Create additional `.zshrc.*` files in `home/shell/` and update the shell module to support new hostnames.

## Customizing Configuration

### Environment Variables

Edit `home/default.nix` and modify `home.sessionVariables`.

### Programs

Enable/disable programs in host files or `home/default.nix`:
```nix
programs.someProgram.enable = true;
```

### Home Packages

Add packages to the appropriate file in `home/packages/`:
```nix
home.packages = with pkgs; [
  new-package
];
```

## Troubleshooting

### Configuration Not Applying

1. Check for syntax errors:
   ```bash
   nix eval .#homeConfigurations.<hostname> --apply config 2>&1 | head -50
   ```

2. View generated activation script:
   ```bash
   nix build .#homeConfigurations.<hostname>.activationPackage --print-out-paths
   ```

### Shell Not Loading

Make sure your shell profile sources the Home Manager environment:
```bash
# Add to ~/.zshrc or ~/.profile
. ~/.nix-profile/etc/profile.d/hm-session-vars.sh
```

## References

- [Home Manager Manual](https://nix-community.github.io/home-manager/)
- [Nix Flakes](https://nix.dev/manual/nix/2.24/command-ref/new-cli-nix#sec-flakes)
- [Nixpkgs](https://nixpkgs Manual)
