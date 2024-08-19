{
  bing-wallpaper-server,
  pkgs,
  ...
}: {
  boot = {
   initrd.luks.devices."luks-f223570a-d11c-4439-b7bf-834144b782ee".device = "/dev/disk/by-uuid/f223570a-d11c-4439-b7bf-834144b782ee";

    kernelParams = [
      "quiet" #"vt.default_red=30,243,166,249,137,245,148,186,88,243,166,249,137,245,148,166" "vt.default_grn=30,139,227,226,180,194,226,194,91,139,227,226,180,194,226,173" "vt.default_blu=46,168,161,175,250,231,213,222,112,168,161,175,250,231,213,200"
    ];
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
  sound.enable = false;
  users.defaultUserShell = pkgs.zsh;
  programs = {
    ssh.startAgent = true;
    zsh.enable = true;
  };
  services = {
    power-profiles-daemon.enable = false;
    tlp.enable = true;
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
              command = "/run/current-system/sw/bin/nix*";
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
      bing-wallpaper-server.packages.${pkgs.system}.bing-wallpaper-server
    }/bin/bing-wallpaper-server 10000 /tmp/image.jpg";
    wantedBy = ["multi-user.target"];
    enable = true;
    wants = ["network-online.target"];
  };
}
