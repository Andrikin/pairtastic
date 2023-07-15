-- INFO: Ao criar maps, utilizar função anônima para retornar strings

local pairtastic = {}
local utils = require('pairtastic.utils')
local text_object = require('pairtastic.text_object')

function pairtastic.setup(opt)
	print('Why you are looking for setup in here?')
end

function pairtastic.block_mode()
	return vim.fn.getcmdtype() ~= ':'
end

function pairtastic.get_text_object()
	return text_object.get()
end

function pairtastic.command(key)
	return utils.duplicate(key)
end

-- Executa comando
function pairtastic.pair(key)
	if pairtastic.block_mode() then
		return key
	end
	return utils.duplicate(key)
end

return pairtastic

