{
  config,
  ...
}:
{
  programs.nh = {
    enable = true;
    # TODO: figure out how to do this automatically
    flake = "${config.home.homeDirectory}/nixos";
  };
}
