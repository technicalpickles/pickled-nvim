-- https://github.com/neovim/neovim/pull/17446#issuecomment-1377543620
--
-- vim.o.statuscolumn = '%=%l%s%{foldlevel(v:lnum) > foldlevel(v:lnum - 1) ? (foldclosed(v:lnum) == -1 ? "▼" : "⏵") : " " }'
-- vim.o.statuscolumn = '%=%l%s%#FoldColumn#%{foldlevel(v:lnum) > foldlevel(v:lnum - 1) ? (foldclosed(v:lnum) == -1 ? "" : "" : " " }%*'
----- statuscolumn specific
-- %l	line number of currently drawn line
-- %r	relative line number of currently drawn line
-- %s	sign column for currently drawn line
-- %C	fold column for currently drawn line
----- statusline 
-- %=   Separation point between alignment sections. Each section will be separated by an equal number of spaces. No width fields allowed.
-- %#   Set highlight group.  The name must follow and then a # again. Thus use %#HLname# for highlight group HLname.  The same highlighting is used, also for the statusline of non-current
-- windows.
-- %{   Evaluate expression between "%{" and "}" and substitute result.
-- 	    Note that there is no "%" before the closing "}".  The
-- 	    expression cannot contain a "}" character, call a function to
-- 	    work around that.  See |stl-%{| below.
-- {%   This is almost same as "{" except the result of the expression is
-- 	    re-evaluated as a statusline format string.  Thus if the
-- 	    return value of expr contains "%" items they will get expanded.
-- 	    The expression can contain the "}" character, the end of
-- 	    expression is denoted by "%}".
--
-- customize statuscolumn to show a single open/close w/o any numbers for nested folds
-- depends on HEAD. places to track:
-- - https://github.com/kevinhwang91/nvim-ufo/issues/4
-- - https://github.com/neovim/neovim/pull/17446
-- - https://github.com/neovim/neovim/pull/20621
--
-- vim.o.statuscolumn = '%=%l%s%#FoldColumn#%{foldlevel(v:lnum) > foldlevel(v:lnum - 1) ? (foldclosed(v:lnum) == -1 ? "" : "") : " " } %*'

_G.ScFoldToggleIcon = function(lnum)
	local previous_line_foldlevel = vim.fn.foldlevel(lnum - 1)
	local current_line_foldlevel = vim.fn.foldlevel(lnum)
	if  current_line_foldlevel > previous_line_foldlevel then
		if vim.fn.foldclosed(lnum) == -1 then -- opened
			return "" -- point down
		else
			return "" -- point right
		end
	else
		return " "
	end
end

_G.ScAppropriateLineNo = function(lnum, relnum)
	if vim.o.number then
		local last_lineno = vim.fn.line("$")
		local width = vim.fn.len(last_lineno)
		local padded_for_last_line = "%"..width.."s"
		if relnum > 0 then
			-- padded relative number, then blanks to padd for where new line will be elsewher
			return string.format(padded_for_last_line, "") .. "%#LineNr#" .. string.format(padded_for_last_line, relnum)
		else
			return "%#CursorLineNr#" .. string.format(padded_for_last_line, lnum) .. string.format(padded_for_last_line, "")
		end
	else
		return ""
	end
end

-- vim.o.statuscolumn = '%= '
--   .. '%s' -- sign column FIXME: figure out how to put on the other side without having to do a lot of shifting
--   -- .. '%{%v:lua.ScAppropriateLineNo(v:lnum, v:relnum)%}'
--   .. '%{%' -- evaluate this, and then evaluate what it returns
--     .. '&number ?'
--       .. '(v:relnum ?'
-- 	    .. 'printf("%"..len(line("$")).."s", v:relnum)' -- when showing relative numbers, make sure to pad so things don't shift as you move the cursor
--       .. ':'
-- 		.. 'v:lnum'
--       .. ')'
-- 	.. ':'
--       .. '""'
-- 	.. ' ' -- space between lines and fold
--   .. '%}'
--   .. '%= '
--   .. '%#FoldColumn#' -- highlight group for fold
--   -- .. '%{v:lua.ScFoldToggleIcon(v:lnum)}'
--   .. '%{' -- expression for showing fold expand/colapse
--     .. 'foldlevel(v:lnum) > foldlevel(v:lnum - 1)' -- any folds?
--       .. '? (foldclosed(v:lnum) == -1' -- currently open?
--         .. '? ""' -- point down
--         .. ': ""' -- point to right
--   	  .. ')'
--   	.. ': " "' -- blank for no fold, or inside fold
--   .. '}'
--   .. '%= ' -- spacing between end of column and start of text
