--[[/* IMPORTS */]]

local libmodal = require 'libmodal'

--[[/* MODULE */]]

--- `Paste` lines of text.
--- @param text string|table the liens of text to paste.
local function paste(text)
	-- Add a space to the bottom of the snippet.
	if type(text) == 'string' then
		text = {text}
	end

	text[#text+1] = ''

	local line = vim.api.nvim_win_get_cursor(0)[1]
	vim.api.nvim_buf_set_lines(0, line, line, true, text)

	local new_line, col = unpack(vim.api.nvim_win_get_cursor(0))
	vim.api.nvim_win_set_cursor(0, {new_line + (#text or 1), col})

	libmodal.utils.api.mode_exit()
end

--- `paste` a code block of a given language.
--- @param language string the language of the code block.
--- @param template string|table example code for the code block.
local function paste_code(language, template)
	if not language then
		language = vim.fn.input '\nWhich language?\n> '
	end

	-- This is the delimiter for a markdown codeblock.
	local DELIMITER = "```"

	local to_paste = {DELIMITER..language}

	if template then -- Format the template.
		if type(template) ~= 'table' then
			template = {template}
		end

		for _, line in ipairs(template) do
			to_paste[#to_paste+1] = line
		end
	else -- Add a blank line
		to_paste[#to_paste+1] = ''
	end

	-- Add the ending delimiter.
	to_paste[#to_paste+1] = DELIMITER

	paste(to_paste)
end

--- @param template string|table a reminder of how to format this kind of diagram.
--- @return function paste function which can be called to create a mermaid template.
local function paste_mermaid_fn(template)
	return function() paste_code('mermaid', template) end
end


--- Create a table given a certain number of user input columns.
local function _paste_table()
	-- Get the number of columns.
	local columns = vim.fn.input '\nHow many columns?\n> '

	-- Create the text for the table.
	local table_text = {'|', '|'}
	for _ = 1, columns do
		table_text[1] = (table_text[1] or '')..' Placeholder |'
		table_text[2] = (table_text[2] or '')..':--:|'
	end

	-- Paste the table.
	paste(table_text)

	-- Format the just-pasted table.
	-- This might have to be adjusted to =2
	if vim.fn.exists ':TableFormat' > 1 then
		vim.api.nvim_command 'TableFormat'
	end
end

--[[/* PUBLICIZE MODULE */]]
return function() libmodal.prompt.enter('marktext',
{
	['classDiagram'] = paste_mermaid_fn{'classDiagram',
		'\tAnimal <|-- Duck'
	},
	['code'] = paste_code,
	['erDiagram'] = paste_mermaid_fn{'erDiagram',
		'\tFOO o|--|{ BAR : "example"'
	},
	['gantt'] = paste_mermaid_fn{'gantt',
		'\ttitle Placeholder',
		'\tdateFormat YYYY-MM-DD',
		'\tsection NameHere',
		'\t\tA task           :a1, 2014-01-01, 30d',
		'\t\tAnother task     :after a1, 20d',
		'\tsection Another',
		'\t\tTask in sec      :2014-01-12, 12d',
		'\t\tanother task     :24d',
	},
	['graph'] = paste_mermaid_fn{'graph LR',
		'\tA --> B'
	},
	['latex'] = function() paste{'$$', '', '$$'} end,
	['pie'] = paste_mermaid_fn{'pie',
		'\ttitle Placeholder',
		'\t"Cheese" : 42.96',
		'\t"Dogs" : 50.05',
		'\t"Apples" : 10.01',
	},
	['sequenceDiagram'] = paste_mermaid_fn{'sequenceDiagram',
		'\tAlice->>John: Example text'
	},
	['journey'] = paste_mermaid_fn{'journey',
		"\ttitle My day",
		"\tsection Office",
		"\t\tDo work: 1: Me, Cat",
		"\tsection Home",
		"\t\tSit down: 5: Me"
	},
	['stateDiagram'] = paste_mermaid_fn{'stateDiagram-v2',
		'\t[*] --> Still',
		'\tStill --> Moving'
	},
	['table'] = _paste_table
}) end
