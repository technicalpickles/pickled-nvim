local M = {}

local pidfile_path = "tmp/neovim.pid"
local servernamefile_path = "tmp/neovim.servername"

local function write()
	local pidfile, _ = io.open(pidfile_path, "w")
	local pid = vim.fn.getpid()
	if pidfile then
		pidfile:write(pid)
		pidfile:close()
	end

	local servernamefile, _ = io.open(servernamefile_path, "w")
	if servernamefile then
		servernamefile:write(vim.v.servername)
		servernamefile:close()
	end
end

M.save_servername = function()
	local servernamefile, _ = io.open(servernamefile_path, "r")
	local pidfile, _ = io.open(pidfile_path, "r")

	-- if the files exist, see if the process is still running
	if servernamefile and pidfile then
		local pid = pidfile:read("*a")
		local servername = servernamefile:read("*a")
		pidfile:close()
		servernamefile:close()

		print("pid: " .. pid)
		print("servernamefile: " .. servername)
		-- make sure it's an integer, ie a pid
		if string.find(pid, "^%d+\n?$") then
			ps = io.popen("ps -p " .. pid .. " -o pid=", "r")
			local running_pid = ps:read("*a")
			if string.find(running_pid, "^%d+\n?$") then
				print("Running nvim already established servername in " .. vim.fn.getcwd())
			else
				print("Old pid found for " .. vim.fn.getcwd() .. ", writing new one")
				write()
			end
		else
			print("Unexpected format of pid: " .. pid)
			write()
		end
	else
		print("No pidfiles found for " .. vim.fn.getcwd() .. ", writing one now")
		write()
	end
end

return M
