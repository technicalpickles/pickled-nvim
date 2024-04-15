local M = {}

M.indicator = function(up, down, r_idx)
	local sfw = vim.v.searchforward == 1
	local indicator, text, chunks
	local abs_r_idx = math.abs(r_idx)
	if abs_r_idx > 1 then
		indicator = string.format("%d%s", abs_r_idx, sfw ~= (r_idx > 1) and up or down)
	elseif abs_r_idx == 1 then
		indicator = sfw ~= (r_idx == 1) and up or down
	else
		indicator = ""
	end

	return indicator
end

M.text = function(plist, nearest, idx, indicator, highlight)
	local text, chunks

	if nearest then
		local cnt = #plist
		if indicator ~= "" then
			text = string.format("[%s %d/%d]", indicator, idx, cnt)
		else
			text = string.format("[%d/%d]", idx, cnt)
		end
		chunks = { { " ", "Ignore" }, { text, highlight } }
	else
		text = string.format("[%s %d]", indicator, idx)
		chunks = { { " ", "Ignore" }, { text, highlight } }
	end

	return text, chunks
end

return M
