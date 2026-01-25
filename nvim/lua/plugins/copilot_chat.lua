return {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
      -- See Configuration section for options
    },
    config = function()
        require("CopilotChat").setup({
            window = {
                layout = 'vertical',       -- 'vertical', 'horizontal', 'float'
                width = 0.3,               -- 10% of screen width
            },
        })
    end
}
