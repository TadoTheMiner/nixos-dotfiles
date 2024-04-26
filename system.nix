{ pkgs, ... }:
let path = "/run/current-system/sw/bin/";
in {
  services.printing.enable = false;
  boot = {
    kernelParams = [ "quiet" ];
    loader = {
      systemd-boot = {
        enable = true;
        consoleMode = "max";
      };
      efi.canTouchEfiVariables = true;
      timeout = 1;
    };
    kernel.sysctl."kernel.sysrq" = "1";

  };

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };
  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  security.sudo = {
    enable = true;
    extraRules = [{
      commands = [
        {
          command = "${path}systemctl";
          options = [ "NOPASSWD" ];
        }
        {
          command = "${path}nix*";
          options = [ "NOPASSWD" ];
        }
      ];
      groups = [ "wheel" ];
    }];
  };

  systemd.services.bing-wallpaper-server = {
    script = "${
        pkgs.callPackage ./packages/bing-wallpaper-server.nix { }
      }/bin/bing-wallpaper-server 10000 /tmp/image.jpg";
    wantedBy = [ "multi-user.target" ];
    enable = true;
    wants = [ "network-online.target" ];
  };
}
