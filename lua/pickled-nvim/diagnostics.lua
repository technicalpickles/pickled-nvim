local M = {}

local silent_noremap = { noremap = true, silent = true }

-- from lazy.nvim
function M.keys_opts(keys)
  local opts = {}
  for k, v in pairs(keys) do
    if type(k) ~= "number" and k ~= "mode" and k ~= "id" then
      opts[k] = v
    end
  end
  return opts
end

M.setup = function()
	-- FIXME make trouble lazy
	require("trouble").setup(M.opts.trouble)
end

return M
