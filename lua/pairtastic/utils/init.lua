local utils = {}
local fn = vim.fn

function utils.get_vtext()
	local text = ''
	return text
end

function utils.get_line_text(mode)
	local line = nil
	if mode == 'c' then
		line = fn.getcmdline()
	else
		line = fn.getline('.')
	end
	return line
end

-- falsy value
function utils.c_mode()
	local c = fn.getcmdtype()
	if c == '' then
		return nil
	end
	return c
end

function utils.mode()
	return utils.c_mode() or fn.mode()
end


function utils.replace_text(text)
end

return utils
