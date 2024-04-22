{ ... }: {
  programs.firefox = {
    enable = true;
    preferences = { "widget.use-xdg-desktop-portal.file-picker" = 1; };
    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
      DisablePocket = true;
      DisplayBookmarksToolbar = "always"; # alternatives: "always" or "newtab"
      DisplayMenuBar = "off"; # alternatives: "always", "never" or "default-on"
      SearchBar = "unified"; # alternative: "separate"

    };
  };

}
