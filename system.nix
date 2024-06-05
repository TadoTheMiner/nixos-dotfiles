{pkgs, ...}: let
  path = "/run/current-system/sw/bin/";
in {
  boot = {
    kernelParams = ["quiet"];
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      timeout = 1;
    };
  };
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };

  sound.enable = true;
  hardware.pulseaudio.enable = false;

  services = {
    power-profiles-daemon.enable = false;
    tlp.enable = true;
    printing.enable = false;
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
    };
  };

  security = {
    rtkit.enable = true;
    sudo = {
      enable = true;
      extraRules = [
        {
          commands = [
            {
              command = "${path}nix*";
              options = ["NOPASSWD"];
            }
          ];
          groups = ["wheel"];
        }
      ];
    };
  };

  systemd.services.bing-wallpaper-server = {
    script = "${
      pkgs.callPackage ./packages/bing-wallpaper-server.nix {}
    }/bin/bing-wallpaper-server 10000 /tmp/image.jpg";
    wantedBy = ["multi-user.target"];
    enable = true;
    wants = ["network-online.target"];
  };
}
