require("basics")
require("plugins")
require("keybindings")
require("navigation")
require("ui")
require("language-support")
require("search")
require("quickfix")

local silent_noremap = {noremap = true, silent = true}

local command_center = require("command_center")
command_center.add({
    {description = "Copy GitHub Permalink", cmd = "<leader>gy"}, {
        description = "Format Document",
        cmd = function() vim.lsp.buf.formatting_sync() end,
        keybindings = {"n", "<leader>f", silent_noremap}
    }
})

require("surround").setup({mappings_style = "surround"})

require("toggleterm").setup({open_mapping = [[<C-`>]], hide_numbers = true})

require("project_nvim").setup({})
require("auto-session").setup({
    log_level = "warning",
    -- don't restore by default, so you can use select it from home screen
    auto_restore_enabled = false
})

require("vgit").setup()
