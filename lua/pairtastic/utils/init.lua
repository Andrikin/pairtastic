local utils = {}

local fn = vim.fn

local buf = fn.getbufinfo()[1].bufnr

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
