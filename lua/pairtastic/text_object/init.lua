local object = {}
local vim = vim.fn

-- falsy value
function object.c_mode()
	local c = vim.getcmdtype()
	if c == '' then
		return nil
	end
	return c
end

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

-- Retorna todas as propriedades do objeto-texto
function object.get()
	local text = {
		mode = object.c_mode() or vim.mode(),
		text = object.get_string(),
		char_before = object.c_before(),
		char_after = object.c_after(),
		_start = 0,
		_end = 0,
		_column = 0,
		_line = 0,
	}
	return text
end

return object
