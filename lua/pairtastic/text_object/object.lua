-- Objeto texto: o que ele representa?
-- R: O conjunto inteiro de um bloco onde o início é o char alvo do pareamento,
-- e o final é o char que fecha o pareamento.

local object = {}

local fn = vim.fn
local utils = require('pairtastic.utils')

local _metadata = {
	mode = utils.mode(),
	begin = 0,
	last = 0,
	col = 0,
	line = 0,
}

-- Set cursor position
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

-- WIP
function object.is_comment()
	return false
end

function object.get_char_before()
	local line = ''
	local char = ''
	if _metadata.mode == 'c' then
		line = fn.getcmdline()
		if #line == 0 then return char end
		char = string.sub(line, _cursor.col - 2, _cursor.col - 2)
	elseif _metadata.mode == 'i' then
		line = fn.getline(_cursor[1])
		char = string.sub(line, _cursor.col - 1, _cursor.col - 1)
	end
	return char
end

function object.get_char_after()
	local line = ''
	local char = ''
	if _metadata.mode == 'c' then
		line = fn.getcmdline()
		if #line == 0 then return char end
		char = string.sub(line, _cursor.col + 2, _cursor.col + 2)
	elseif _metadata.mode == 'i' then
		line = fn.getline(_cursor[1])
		char = string.sub(line, _cursor.col + 1, _cursor.col + 1)
	end
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
		fn.getline(_metadata.begin, _metadata.last),
		1,
		1
	)
end

-- Set boundaries for text object when incomplete pair
function object.get_boundaries(key)
	local begin = nil
	local last = nil
	if _metadata.mode == 'c' then
		-- use regex to find key and others pattern
	elseif _metadata.mode == 'i' then
		local opposite = utils.char2nr_opposite(key)
		local b1 = fn.searchpos(key, 'nbW')
		local b2 = fn.searchpairpos(key, key .. '|' .. opposite, opposite, 'nbW')
		if b1[1] == b2[1] and b1[2] == b2[2] then
			begin = b1
			last = fn.searchpos(opposite, 'nW')
		end
	end
	return {
		-- returning coordinates {line, col}
		begin = begin,
		last = last,
	}
end

-- Retorna todas as propriedades do objeto-texto
function object.get(key)
	_metadata.boundary = object.get_boundaries(key)
	_metadata.line = object.get_line_text()
	return _metadata
end

return object
