{...}: {
  programs.atuin = {
    enable = true;
    settings = {
      style = "compact";
      update_check = false;
    };
  };
}
