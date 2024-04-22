{ ... }: {
  "inherits" = "catppuccin_mocha";
  "ui.background" = { };
  "ui.popup" = {
    fg = "text";
    bg = "mantle";
  };
  "ui.help" = {
    fg = "text";
    bg = "mantle";
  };
  "ui.statusline" = {
    fg = "text";
    bg = { };
    modifiers = [ "bold " ];
  };
  "ui.statusline.inactive" = {
    fg = "text";
    bg = "mantle";
  };
  "ui.selection" = {
    bg = "mantle";
    modifiers = [ "bold" ];
  };
  "ui.text.focus" = {
    fg = "lavender";
    bg = "mantle";
    modifiers = [ "bold" ];
  };
  "ui.highlight" = {
    bg = "mantle";
    modifiers = [ "bold" ];
  };
  "ui.linenr" = { fg = "overlay2"; };
  "punctuation" = "peach";
  "ui.menu" = {
    fg = "text";
    bg = "mantle";
  };
  "ui.menu.selected" = {
    fg = "peach";
    bg = "mantle";
    modifiers = [ "bold" ];
  };
  "ui.bufferline" = {
    fg = "subtext0";
    bg = "mantle";
  };
  "ui.bufferline.active" = {
    fg = "mauve";
    bg = "mantle";
    underline = {
      color = "mauve";
      style = "line";
    };
  };
  "ui.bufferline.background" = { bg = "mantle"; };
  "ui.text.inactive" = {
    fg = "text";
    bg = "mantle";
  };
}
