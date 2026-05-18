-- lua/custom/plugins/mini.lua
return {
  {
    'echasnovski/mini.nvim',
    enabled = true,
    config = function()
      local statusline = require 'mini.statusline'
      statusline.setup { use_icons = true }
      MiniStatusline.section_lsp = function(args)
        -- Проверяем ширину экрана (если окно слишком узкое — скрываем)
        if MiniStatusline.is_truncated(args.trunc_width or 75) then return '' end

        -- Получаем список реальных клиентов для текущего буфера
        local clients = vim.lsp.get_clients({ bufnr = 0 })
        if #clients == 0 then return '' end

        -- Собираем их имена в одну строку
        local names = {}
        for _, client in ipairs(clients) do
          table.insert(names, client.name)
        end
        local attached = table.concat(names, ',')

        -- Определяем иконку (берём из аргументов или ставим дефолтную)
        local use_icons = args.use_icons or MiniStatusline.config.use_icons
        local icon = args.icon or (use_icons and '󰰎' or 'LSP')

        return icon .. ' ' .. attached
      end
    end
  },
}
