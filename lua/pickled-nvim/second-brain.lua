-- local home = vim.fn.expand("~/Documents/rpg")
-- NOTE for Windows users:
-- - don't use Windows
-- - try WSL2 on Windows and pretend you're on Linux
-- - if you **must** use Windows, use "/Users/myname/zettelkasten" instead of "~/zettelkasten"
-- - NEVER use "C:\Users\myname" style paths
-- - Using `vim.fn.expand("~/zettelkasten")` should work now but mileage will vary with anything outside of finding and opening files
-- require('telekasten').setup({
-- 	home = home,

-- 	-- don't set filetype to telekasten, because it isn't as full featured as markdown
-- 	auto_set_filetype = false, -- default: true

--     -- dir names for special notes (absolute path or subdir name)
--     dailies      = home .. '/' .. 'Daily',
--     weeklies     = home .. '/' .. 'Weekly',
--     templates    = home .. '/' .. 'Templates',

--     -- image (sub)dir for pasting
--     -- dir name (absolute path or subdir name)
--     -- or nil if pasted images shouldn't go into a special subdir
--     image_subdir = "Attachments",

--     -- Generate note filenames. One of:
--     -- "title" (default) - Use title if supplied, uuid otherwise
--     -- "uuid" - Use uuid
--     -- "uuid-title" - Prefix title by uuid
--     -- "title-uuid" - Suffix title with uuid
--     new_note_filename = "title",
--     -- file uuid type ("rand" or input for os.date()")
--     uuid_type = "%Y%m%d%H%M",
--     -- UUID separator
--     uuid_sep = "-",

--     -- following a link to a non-existing note will create it
--     follow_creates_nonexisting = true,
--     dailies_create_nonexisting = true,
--     weeklies_create_nonexisting = true,

--     -- template for new notes (new_note, follow_link)
--     -- set to `nil` or do not specify if you do not want a template
--     template_new_note = home .. '/' .. 'templates/new_note.md',

--     -- template for newly created daily notes (goto_today)
--     -- set to `nil` or do not specify if you do not want a template
--     template_new_daily = home .. '/' .. 'templates/daily.md',

--     -- template for newly created weekly notes (goto_thisweek)
--     -- set to `nil` or do not specify if you do not want a template
--     template_new_weekly= home .. '/' .. 'templates/weekly.md',

--     -- integrate with calendar-vim
--     plug_into_calendar = false,
--     calendar_opts = {},

--     -- telescope actions behavior
--     close_after_yanking = false,
--     insert_after_inserting = true,

--     -- when linking to a note in subdir/, create a [[subdir/title]] link
--     -- instead of a [[title only]] link
--     subdirs_in_links = false,

-- 	vaults = {
-- 		-- default = {
-- 		-- 	home = '~/Documents/pickled-knowledge/',
-- 		-- },
-- 		rpg = {
-- 			home = "~/Documents/rpg",
-- 		},
-- 	},

--     -- how to preview media files
--     -- "telescope-media-files" if you have telescope-media-files.nvim installed
--     -- "catimg-previewer" if you have catimg installed
--     media_previewer = "catimg-previewer",
-- })

-- vim.keymap.set("n", "<leader>zf", ":lua require('telekasten').find_notes()<CR>", { noremap = true, silent = true, desc = "Zettelkasten: Find Note (File)"})
-- vim.keymap.set("n", "<leader>zd", ":lua require('telekasten').find_daily_notes()<CR>", { noremap = true, silent = true, desc = "Zettelkasten: Find Daily Notes"})
-- vim.keymap.set("n", "<leader>zg", ":lua require('telekasten').search_notes()<CR>", { noremap = true, silent = true, desc = "Zettelkasten: Find Daily Notes"})
-- vim.keymap.set("n", "<leader>zz", ":lua require('telekasten').follow_link()<CR>", { noremap = true, silent = true, desc = "Telekasten: Follow Link" })

-- -- on hesitation, bring up the panel
-- vim.keymap.set("n", "<leader>z", ":lua require('telekasten').panel()<CR>", { noremap = true, silent = true, desc = "Zettelkasten: Open Panel" })
