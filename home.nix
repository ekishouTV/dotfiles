{ config, pkgs, ... }:

let
  inherit (config.lib.file) mkOutOfStoreSymlink;
  userName = "ekishoutv";
  userDirectory = "/home/${userName}";
  dotfilesDirectory = "/home/${userName}/dotfiles/";
in

{
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
  programs.bash = {
    enable = true;
    sessionVariables = {
      SSH_AUTH_SOCK = "${userDirectory}/.bitwarden-ssh-agent.sock";
    };
  };
  programs.mise = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.obsidian = {
    enable = true;
    cli.enable = true;
  };
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
    ];
  };
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
  };
}
