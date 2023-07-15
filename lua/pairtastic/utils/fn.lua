local utils = {}

local fn = vim.fn

local buf = fn.getbufinfo()[1].bufnr

local command = '<left>'

-- Generic pairs
-- TODO: How add more?
local char2number = {
	[91] = {
		opposite = 93
	},
	[93] = {
		opposite = 91
	},
	[40] = {
		opposite = 41
	},
	[41] = {
		opposite = 40
	},
	[123] = {
		opposite = 125
	},
	[125] = {
		opposite = 123
	},
	[34] = {
		opposite = 34
	},
	[39] = {
		opposite = 39
	},
	[60] = {
		opposite = 60
	}
}

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

function utils.duplicate(key)
	command = char2number[fn.char2nr(key)].opposite .. command
	return command
end

function utils.char2nr_opposite(number)
	return char2number[number].opposite
end

return utils

