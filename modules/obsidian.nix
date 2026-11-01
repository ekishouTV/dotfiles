{ config, pkgs, ... }:

{
  programs.obsidian = {
    enable = true;
    cli.enable = true;
  };
}
