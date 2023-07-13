-- Objeto texto: o que ele representa?
-- R: O conjunto inteiro de um bloco onde o início é o char alvo do pareamento,
-- e o final é o char que fecha o pareamento.

local object = {}
-- local fn = vim.fn
local utils = require('pairtastic.utils')

function object.is_comment()
	return false
end

function object.c_before()
	local c = ''
	return c
end

function object.c_after()
	local c = ''
	return c
end

function object.get_string()
	return ''
end

local _metadata = {
	mode = utils.mode(),
	text = object.get_string(),
	is_comment = object.is_comment(),
	char_before = object.c_before(),
	char_after = object.c_after(),
	_start = 0,
	_end = 0,
	_column = 0,
	_line = 0,
}
_metadata.line = utils.get_line_text(_metadata.mode)

-- Retorna todas as propriedades do objeto-texto
function object.get()
	return _metadata
end

return object
