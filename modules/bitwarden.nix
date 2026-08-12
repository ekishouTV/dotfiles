{ config, pkgs, ... }:

{
  home = with config; {
    packages = with pkgs; [
      bitwarden-desktop
    ];
    sessionVariables = {
      SSH_AUTH_SOCK = "${home.homeDirectory}/.bitwarden-ssh-agent.sock";
    };
  };
}
