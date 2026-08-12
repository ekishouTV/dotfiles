{ config, pkgs, inputs, ... }:

{
  targets.genericLinux.nixGL = {
    packages = inputs.nixgl.packages;
    defaultWrapper = "mesa";
    installScripts = [ "mesa" ];
  };

# TODO: Migrate an extension settings to Nix.
#  home = {
#    packages = with pkgs.gnomeExtensions; [
#      bluetooth-battery-meter
#      caffeine
#      clipboard-indicator
#      emoji-copy
#      gsconnect
#      just-perfection
#      resource-monitor
#      solaar-extension
#      sound-percentage
#    ];
#  };

  dconf = {
    enable = true;
    settings = {
      "org/gnome/shell" = {
#        enabled-extensions = with pkgs.gnomeExtensions; [
#          bluetooth-battery-meter.extensionUuid
#          caffeine.extensionUuid
#          clipboard-indicator.extensionUuid
#          emoji-copy.extensionUuid
#          gsconnect.extensionUuid
#          just-perfection.extensionUuid
#          resource-monitor.extensionUuid
#          solaar-extension.extensionUuid
#          sound-percentage.extensionUuid
#        ];
        favorite-apps = [
          "firefox_firefox.desktop"
          "org.gnome.Nautilus.desktop"
          "com.mitchellh.ghostty.desktop"
          "obsidian.desktop"
          "dev.zed.Zed.desktop"
          "microsoft-edge.desktop"
        ];
      };
      "org/gnome/shell/extensions/dash-to-dock" = {
        dock-fixed = false;
        dock-position = "BOTTOM";
        extend-height = false;
      };
      "org/gnome/desktop/input-sources" = {
        xkb-options = [
          "ctrl:nocap"
          "caps:ctrl_modifier"
        ];
      };
    };
  };

  gtk = {
    enable = true;
    iconTheme = {
      name = "Numix-Circle";
      package = pkgs.numix-icon-theme-circle;
    };
    font = {
      name = "Udev Gothic 35JPDOC";
      package = pkgs.udev-gothic;
    };
  };
}
