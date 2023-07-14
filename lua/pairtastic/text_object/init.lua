-- Objeto texto: o que ele representa?
-- R: O conjunto inteiro de um bloco onde o início é o char alvo do pareamento,
-- e o final é o char que fecha o pareamento.

local object = {}

local fn = vim.fn
local utils = require('pairtastic.utils')

local _metadata = {
	cursor = {_cursor[2], _cursor[3]},
	mode = utils.mode(),
	l_start = 0,
	l_end = 0,
	l_column = 0,
	l_line = 0,
}

local _cursor = nil
_metadata.cursor = nil
if _metadata.mode == 'c' then
	_cursor = fn.getcmdpos()
	_metadata = {
		line = nil,
		col = _cursor
	}
elseif _metadata.mode == 'i' then
	_cursor = fn.getcursorcharpos()
	_metadata.cursor = {
		line = _cursor[2],
		col = _cursor[3],
	}
end

function object.is_comment()
	return false
end

-- TODO: Obter conforme modo: CommandMode ou InsertMode
function object.get_char_before()
	local line = ''
	local char = ''
	if _metadata.mode == 'c' then
		line = fn.getcmdline()
		if #line == 0 then return '' end
		char = string.sub(line, _cursor.col - 2, _cursor.col - 2)
	elseif _metadata.mode == 'i' then
		line = fn.getline(_cursor[1])
		char = string.sub(line, _cursor.col - 1, _cursor.col - 1)
	end
	return char
end

-- TODO: Obter conforme modo: CommandMode ou InsertMode
function object.get_char_after()
	local line = fn.getline(_cursor[1])
	local char = string.sub(line, _cursor[2] + 1, _cursor[2] + 1)
	return char
end

function object.get_line_text()
	local line = nil
	if _metadata.mode == 'c' then
		line = fn.getcmdline()
	else
		line = fn.getline('.')
	end
	return line
end

-- WIP
function object.get_string_text()
	return string.sub(
		fn.getline(_metadata.l_start, _metadata.l_end),
		1,
		1
	)
end

_metadata.line = object.get_line_text()

-- Retorna todas as propriedades do objeto-texto
function object.get()
	return _metadata
end

return object
