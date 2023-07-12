-- INFO: Ao criar maps, utilizar função anônima para retornar strings

local pairtastic = {}

local text_object = require('pairtastic.text_object')
local comando = '<left>'

function pairtastic.setup(opt)
	print('Why you are looking for setup in here?')
end

function pairtastic.block_mode()
	return vim.fn.getcmdtype() ~= ':'
end

function pairtastic.get_text_object()
	return text_object.get()
end

-- Executa comando
function pairtastic.pair()
	local texto = pairtastic.get_text_object()
	return comando
end

return pairtastic
