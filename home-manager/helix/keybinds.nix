{...}: {
  programs.helix.settings.keys = {
    normal = {
      C-A-q = ":qa!";
      C-right = "move_next_word_start";
      C-left = "move_prev_word_end";
    };
    insert = {
      esc = ["normal_mode" ":w"];
      C-A-q = ":qa!";
      C-right = "move_next_word_start";
      C-left = "move_prev_word_end";
    };
    select = {
      C-A-q = ":qa!";
      C-right = "extend_next_word_start";
      C-left = "extend_prev_word_end";
    };
  };
}
