{ ... }: {
programs.helix.settings.keys = {
  normal = {
    "C-A-q" = [ ":qa!" ];
    "C-s" = [ ":w" ];
  };
  insert = {
    "esc" = [ "normal_mode" ":w" ];
    "C-A-q" = [ ":qa!" ];
    "C-s" = [ ":w" ];
  };
};
}
