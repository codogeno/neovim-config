local cmp = require('cmp')
local lspkind = require('lspkind')

cmp.setup{
	snippet = {

		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			require'luasnip'.lsp_expand(args.body) -- Luasnip expand
		end,
	},

	-- Клавиши, которые будут взаимодействовать в nvim-cmp
	mapping = {

		-- Вызов меню автодополнения
		['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
		--['<CR>'] = cmp.config.enable,
		--['<C-y>'] = cmp.mapping.confirm({ select = true }), -- А вот на <C-y> вполне ок

		-- Используем <C-e> для того чтобы прервать автодополнение
		['<C-e>'] = cmp.mapping({
			i = cmp.mapping.abort(), -- Прерываем автодополнение
			c = cmp.mapping.close(), -- Закрываем автодополнение
		}),
		['<M-k>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
		['<M-j>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),

		['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
		['<Down>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),

        ['<Tab>'] = cmp.mapping({
            i = function(fallback)
                if cmp.visible() then
                    cmp.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })
                else
                    fallback()
                end
            end,
            -- s = cmp.mapping.confirm({ select = true }),
            --c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
        }),
	},

	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },                -- LSP 👄
		{ name = 'nvim_lsp_signature_help' }, -- Помощь при введении параметров в методах 🚁
		{ name = 'luasnip' },                 -- Luasnip 🐌
		{ name = 'buffer' },                  -- Буфферы 🐃
		{ name = 'path' },                    -- Пути 🪤
		{ name = "emoji" },                   -- Эмодзи 😳
	}, {
	}),
	formatting = {
		format = lspkind.cmp_format({
			mode = 'symbol', -- show only symbol annotations
			maxwidth = 60,   -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
		})
	}
}
