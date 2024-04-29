{ pkgs, ... }: {
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      format =
        "$directory$git_commit$git_state$git_metrics$git_status$env_var$custom$sudo$line_break$jobs$battery$status$nix_shell$character";
      right_format = "$cmd_duration";
      nix_shell = {
        symbol = " ";
        style = "bold lavender";
        format = "[$symbol$state( ($name))]($style)";
      };
      sudo = {
        symbol = "sudo";
        disabled = false;
      };
      directory = {
        style = "bold peach";
        truncation_length = 4;
      };
      character = { success_symbol = "[❯](bold peach)"; };
      palette = "catppuccin_mocha";
    } // builtins.fromTOML (builtins.readFile (pkgs.fetchFromGitHub {
      owner = "catppuccin";
      repo = "starship";
      rev =
        "5629d2356f62a9f2f8efad3ff37476c19969bd4f"; # Replace with the latest commit hash
      sha256 = "sha256-nsRuxQFKbQkyEI4TXgvAjcroVdG+heKX5Pauq/4Ota0=";
    } + /palettes/mocha.toml));

  };
}
