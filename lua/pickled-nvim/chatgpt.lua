-- read from ~/.chatgpt-nvim.json if it exists and parse it as json
local chatgpt_config = {}
local chatgpt_config_file = vim.fn.expand("~/.chatgpt-nvim.json")
if vim.fn.filereadable(chatgpt_config_file) == 1 then
	chatgpt_config = vim.fn.json_decode(vim.fn.readfile(chatgpt_config_file))
end

local openai_api_key = chatgpt_config["authorization"]
-- set OPENAI_API_KEY API from authorization key in JSON
if openai_api_key then
	vim.env.OPENAI_API_KEY = openai_api_key
end

require("chatgpt").setup({
})
