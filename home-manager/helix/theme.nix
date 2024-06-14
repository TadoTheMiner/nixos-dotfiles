{...}: {
  programs.helix.themes.catppuccin_simplified = {
    inherits = "catppuccin_mocha";
    ui.background = {};
    ui.popup = {
      fg = "text";
      bg = "crust";
    };
    ui.help = {
      fg = "text";
      bg = "crust";
    };
    ui.statusline = {
      fg = "text";
      bg = {};
    };
    ui.statusline.inactive = {
      fg = "text";
      bg = "crust";
    };
    ui.selection = {
      bg = "crust";
    };
    ui.text.focus = {
      fg = "peach";
      bg = "crust";
    };
    ui.highlight = {
      bg = "crust";
    };
    ui.linenr.fg = "overlay2";
    ui.linenr.selected.fg = "peach";
    comment.fg = "overlay2";
    punctuation = "peach";
    ui.menu = {
      fg = "text";
      bg = "crust";
    };
    ui.menu.selected = {
      fg = "peach";
      bg = "crust";
    };
    ui.bufferline = {
      fg = "subtext0";
      bg = "crust";
    };
    ui.bufferline.active = {
      fg = "mauve";
      bg = "crust";
      underline = {
        color = "mauve";
        style = "line";
      };
    };
    ui.bufferline.background.bg = "crust";
    ui.text.inactive = {
      fg = "text";
      bg = "crust";
    };
  };
}
