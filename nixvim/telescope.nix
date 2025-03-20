{
  programs.nixvim.plugins.telescope = {
    # Telescope is a fuzzy finder that comes with a lot of different things that
    # it can fuzzy find! It's more than just a "file finder", it can search
    # many different aspects of Neovim, your workspace, LSP, and more!
    #
    # The easiest way to use Telescope, is to start by doing something like:
    #  :Telescope help_tags
    #
    # After running this command, a window will open up and you're able to
    # type in the prompt window. You'll see a list of `help_tags` options and
    # a corresponding preview of the help.
    #
    # Two important keymaps to use while in Telescope are:
    #  - Insert mode: <c-/>
    #  - Normal mode: ?
    #
    # This opens a window that shows you all of the keymaps for the current
    # Telescope picker. This is really useful to discover what Telescope can
    # do as well as how to actually do it!
    #
    # [[ Configure Telescope ]]
    # See `:help telescope` and `:help telescope.setup()`
    enable = true;

    # Enable Telescope extensions
    extensions = {
      fzf-native.enable = true;
      ui-select.enable = true;
    };

    # You can put your default mappings / updates / etc. in here
    #  See `:help telescope.builtin`
    keymaps = {
      "<leader>sh" = {
        mode = "n";
        action = "help_tags";
        options = {
          desc = "[S]earch [H]elp";
        };
      };
      "<leader>sk" = {
        mode = "n";
        action = "keymaps";
        options = {
          desc = "[S]earch [K]eymaps";
        };
      };
      "<leader>f" = {
        mode = "n";
        action = "find_files";
        options = {
          desc = "Open [F]ile";
        };
      };
      "<leader>ss" = {
        mode = "n";
        action = "builtin";
        options = {
          desc = "[S]earch [S]elect Telescope";
        };
      };
      "<leader>sw" = {
        mode = "n";
        action = "grep_string";
        options = {
          desc = "[S]earch current [W]ord";
        };
      };
      "<leader>sg" = {
        mode = "n";
        action = "live_grep";
        options = {
          desc = "[S]earch by [G]rep";
        };
      };
      "<leader>d" = {
        mode = "n";
        action = "diagnostics";
        options = {
          desc = "Open [D]iagnostics picker";
        };
      };
      "<leader>sr" = {
        mode = "n";
        action = "resume";
        options = {
          desc = "[S]earch [R]esume";
        };
      };
      "<leader>s" = {
        mode = "n";
        action = "oldfiles";
        options = {
          desc = "[S]earch Recent Files ('.' for repeat)";
        };
      };
      "<leader><leader>" = {
        mode = "n";
        action = "buffers";
        options = {
          desc = "[ ] Find existing buffers";
        };
      };
    };
    settings = {
      extensions.__raw = "{ ['ui-select'] = { require('telescope.themes').get_dropdown() } }";
    };
  };
}
