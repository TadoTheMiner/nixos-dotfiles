{...}: {
  programs.helix.settings.keys = rec {
    normal = {
      C-right = "move_next_word_start";
      C-left = "move_prev_word_end";
      C-del = "delete_word_forward";
      C-backspace = "delete_word_backward";
      C-w = ":buffer_close";
      C-t = "file-picker";
      C-pageup = ":buffer-previous";
      C-pagedown = ":buffer-next";
    };
    insert = normal;
    select = normal;
  };
}
