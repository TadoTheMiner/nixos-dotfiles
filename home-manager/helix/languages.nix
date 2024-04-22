{ pkgs, ... }: {
programs.helix.languages = {
  language = [
    {
      name = "nix";
      auto-format = true;
      formatter.command = "${pkgs.nixfmt}/bin/nixfmt";
    }
    {
      name = "rust";
      auto-pairs = {
        "(" = ")";
        "{" = "}";
        "[" = "]";
        "\"" = ''"'';
        "'" = "'";
        "`" = "`";
        "<" = ">";
      };
    }
  ];
  language-server.rust-analyzer.config.check.command = "clippy";
};
}
