{ config, ... }:

{
  programs.bash = {
    enable = true;
    sessionVariables = {
      SSH_AUTH_SOCK = "${config.home.homeDirectory}/.bitwarden-ssh-agent.sock";
    };
  };
}
