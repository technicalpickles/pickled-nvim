local M = {}

-- copied from core.handlers.keys's opts from lazy.nvim
local function keys_opts(key)
	local opts = {}
	for k, v in pairs(key) do
	  if type(k) ~= "number" and k ~= "mode" and k ~= "id" then
		opts[k] = v
	  end
	end
	return opts
end

-- setup keys from a table of tables like lazy.nvim can
M.setup_keys = function(keys)
	for _, key in ipairs(keys) do
		local opts = keys_opts(key)
		local mode = opts.mode or "n"
		vim.keymap.set(mode, key[1], key[2], opts)
	end
end

return M
