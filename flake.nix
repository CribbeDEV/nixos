# Flake.nix
{
  description = "Zums flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-colors.url = "github:misterio77/nix-colors";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nixvim, ... }@inputs:
    let 
# --- SYSTEM CONFIGURATION ---
    systemSettings = {
      system = "x86_64-linux";
      hostname = "nixdesk";
      profile = "nixdesk";
      systemstate = "23.11";
    };

# --- USER CONFIGURATION ---
  userSettings = {
    username = "nixdesk";
    name = "nixdesk";
    editor = "nvim";
    term ="foot";
    browser = "firefox";
    homestate = "23.11";
  };

  pkgs = nixpkgs.legacyPackages.${systemSettings.system};
  lib = nixpkgs.lib;

  in {
    homeConfigurations = {
      user = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ profiles/${systemSettings.profile}/home.nix ];
        extraSpecialArgs = {
          inherit systemSettings;
          inherit userSettings;
          inherit inputs;
        };
      };
    };

    nixosConfigurations = {
      system = lib.nixosSystem {
        system = systemSettings.system;
        modules = [ profiles/${systemSettings.profile}/configuration.nix];
        specialArgs = {
          inherit systemSettings;
          inherit userSettings;
          inherit inputs;
        };
      };
    };


# --- DEVELOPMENT ENVIRONMENTS ---
    devShells.${systemSettings.system}.default =
      pkgs.mkShell
      {
        nativeBuildInputs = with pkgs; [
          stdenv
            cargo
            neovim
            binutils
            clang
            glibc
            nodejs
            pkg-config
            fontconfig
            freetype
            gnumake
            gcc
            gd
            nil
            ffmpeg
            python3Packages.pip
            xorg.libX11
            xorg.libXft
            xorg.libX11.dev
            xorg.libXinerama
            ];
        shellHook = ''
          clear
          echo -e "\033[1;36m[Nix:\033[0m $(lsb_release -s -d)"
          echo -e "\033[1;36m[Load Average:\033[0m $(cut -d ' ' -f 1-3 /proc/loadavg)"
          echo -e "\033[1;36m[Available Memory:\033[0m $(free -h | awk '/Mem/ {print $7}')"
          echo -e "\033[1;36m[CPU Usage:\033[0m $(top -bn1 | awk '/%Cpu/ {printf("%.2f%", $2 + $4)}')"
          echo ""
          export X11INC=${pkgs.xorg.libX11.dev}/include
          export X11LIB=${pkgs.xorg.libX11.out}/lib
          '';
      };
  };
}

