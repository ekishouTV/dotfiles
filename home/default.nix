{ config, pkgs, ... }:

let
  inherit (config.lib.file) mkOutOfStoreSymlink;
  userName = "ekishoutv";
  userDirectory = "/home/${userName}";
  dotfilesDirectory = "/home/${userName}/dotfiles/";
in

{
  imports = [
    ../modules/bash.nix
    ../modules/mise.nix
    ../modules/obsidian.nix
    ../modules/starship.nix
    ../modules/zed.nix
    ../modules/zsh.nix
  ];

  home = {
    username = "${userName}";
    homeDirectory = "${userDirectory}";
    stateVersion = "26.05";

    file = {
      ".config/ghostty/".source = mkOutOfStoreSymlink "${dotfilesDirectory}/.config/ghostty/";
      ".config/zed/".source = mkOutOfStoreSymlink "${dotfilesDirectory}/.config/zed/";
      ".config/mise/".source = mkOutOfStoreSymlink "${dotfilesDirectory}/.config/mise/";
      ".gitconfig".source = mkOutOfStoreSymlink "${dotfilesDirectory}/.gitconfig";
      ".gitattributes".source = mkOutOfStoreSymlink "${dotfilesDirectory}/.gitattributes";
      ".config/starship.toml".source = mkOutOfStoreSymlink "${dotfilesDirectory}/.config/starship.toml";
    };

    packages = with pkgs; [
      bitwarden-desktop
      ghostty
      numix-icon-theme-circle
      microsoft-edge
    ];
  };

  programs.home-manager.enable = true;
}
