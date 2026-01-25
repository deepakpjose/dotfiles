return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local builtin = require("telescope.builtin")
        local telescope = require("telescope")
        local function truncate_path_display(_, path)
          local tail = vim.fn.fnamemodify(path, ":t")
          local parent = vim.fn.fnamemodify(path, ":h")

          if parent == "." or parent == "" then
            return tail
          end

          return string.format("%s  (%s)", tail, vim.fn.pathshorten(parent))
        end

        telescope.setup({
          defaults = {
            path_display = truncate_path_display,
          },
          pickers = {
            buffers = {
              path_display = truncate_path_display, -- ensures buffers also respect it
              sort_lastused = true,
              previewer = false,
            },
          },
        })

        vim.keymap.set('n', '<C-p>', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    end
}
