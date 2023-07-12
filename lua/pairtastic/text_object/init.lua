local object = {}
local vim = vim.fn

function object.c_mode()
	return vim.getcmdtype()
end

function object.is_comment()
end

function object.c_before()
end

function object.c_after()
end

function object.get_string()
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
