-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- leader key 为空
vim.g.mapleader = ";"
vim.g.maplocalleader = ";"

local opt = {
  noremap = true,
  silent = true,
}

-- 本地变量
local map = vim.api.nvim_set_keymap

-- fix :set wrap
-- vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- todo-comments
vim.keymap.set("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

map("n", "lt", ":TodoTelescope<CR>", opt)

-- You can also specify a list of valid jump keywords

-- vim.keymap.set("n", "]t", function()
--   require("todo-comments").jump_next({keywords = { "ERROR", "WARNING" }})
-- end, { desc = "Next error/warning todo comment" })

-- magic search
map("n", "/", "/\\v", { noremap = true, silent = false })
map("v", "/", "/\\v", { noremap = true, silent = false })

-- visual模式下缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
-- 上下移动选中文本
map("v", "<C-Down>", ":move '>+1<CR>gv-gv", opt)
map("v", "<C-Up>", ":move '<-2<CR>gv-gv", opt)

-- 在visual mode 里粘贴不要复制
-- map("v", "p", '"_dP', opt)

-- 退出
map("n", "qq", ":q!<CR>", opt)
map("n", "<C-q>", ":cq<CR>", opt)
-- 保存
map("n", "<C-s>", ":w<CR>", opt)
map("n", "<C-S-s>", "<cmd>wa<CR>", opt)
-- map("n", "<leader>q", ":qa!<CR>", opt)

-- insert 模式下，跳到行首行尾
map("i", "<C-Left>", "<ESC>I", opt)
map("i", "<C-Right>", "<ESC>A", opt)

------------------------------------------------------------------
-- windows 分屏快捷键
------------------------------------------------------------------
-- 取消 s 默认功能
map("n", "s", "", opt)
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)
-- 关闭当前
map("n", "sc", "<C-w>c", opt)
-- 关闭其他
map("n", "so", "<C-w>o", opt) -- close others
-- alt + hjkl  窗口之间跳转
map("n", "<A-Left>", "<C-w>h", opt)
map("n", "<A-Down>", "<C-w>j", opt)
map("n", "<A-Up>", "<C-w>k", opt)
map("n", "<A-Right>", "<C-w>l", opt)
-- 相等比例
map("n", "s=", "<C-w>=", opt)

--------------------------------------------------------------------
-- 插件快捷键
local pluginKeys = {}

-- treesitter 折叠
map("n", "zz", "<cmd>foldclose<CR>", opt)
map("n", "Z", "<cmd>foldopen<CR>", opt)

-- nvim-tree
map("n", "<A-m>", "<cmd>NvimTreeToggle<CR>", opt)

-- bufferline 左右Tab切换
map("n", "<C-Left>", "<cmd>BufferLineCyclePrev<CR>", opt)
map("n", "<C-Right>", "<cmd>BufferLineCycleNext<CR>", opt)
-- "moll/vim-bbye" 关闭当前 buffer
map("n", "<C-c>", "<cmd>Bdelete!<CR>", opt)

-- whitespace
map("n", "<C-t>", "<cmd>StripTrailingWhitespace<CR>", opt)

-- Telescope
map("n", "ff", "<cmd>Telescope find_files<CR>", opt)
map("n", "fw", "<cmd>Telescope grep_string<CR>", opt)
map("n", "fg", "<cmd>Telescope live_grep<CR>", opt)
map("n", "fd", "<cmd>Telescope diagnostics<CR>", opt)
map("n", "fh", "<cmd>Telescope help_tags<CR>", opt)
map("n", "fn", "<cmd>Telescope notify<CR>", opt)

-- 代码注释插件
-- see ./lua/plugin-config/comment.lua
pluginKeys.comment = {
  -- Normal 模式快捷键
  toggler = {
    line = "gcc", -- 行注释
    block = "gbc", -- 块注释
  },
  -- Visual 模式
  opleader = {
    line = "gc",
    bock = "gb",
  },
}
-- ctrl + /
map("n", "<C-_>", "gcc", { noremap = false })
map("v", "<C-_>", "gcc", { noremap = false })
map("n", "<C-/>", "gcc", { noremap = false })
map("v", "<C-/>", "gcc", { noremap = false })

-- lsp 回调函数快捷键设置
pluginKeys.mapLSP = function(mapbuf)
  -- rename
  mapbuf("n", "gr", "<cmd>Lspsaga rename<CR>", opt)
  mapbuf("n", "gr", "<cmd>Lspsaga rename ++project<CR>", opt)
  -- code action
  mapbuf("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
  -- go xx
  mapbuf("n", "gp", "<cmd>Lspsaga peek_definition<CR>", opt)
  mapbuf("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opt)
  mapbuf("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", opt)
  -- diagnostic
  -- mapbuf("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>", opt)
  -- mapbuf("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opt)
  -- mapbuf("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>", opt)
  mapbuf("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<CR>", opt)
  mapbuf("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opt)
  -- mapbuf("n", "gc", "<cmd>Lspsaga yank_line_diagnostics<CR>", opt)
  mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.format { async = true }<CR>", opt)

  mapbuf("n", "<leader>o", "<cmd>Lspsaga outline<CR>", opt)

  mapbuf("n", "K", "<cmd>Lspsaga hover_doc<CR>", opt)
  -- mapbuf("n", "K", "<cmd>Lspsaga hover_doc ++keep<CR>", opt)

  mapbuf("n", "<A-d>", "<cmd>Lspsaga term_toggle<CR>", opt)
end

-- nvim-dap
pluginKeys.mapDAP = function()
  -- 开始
  map("n", "<leader>dd", ":RustDebuggables<CR>", opt)
  -- 结束
  map(
    "n",
    "<leader>de",
    ":lua require'dap'.close()<CR>"
      .. ":lua require'dap'.terminate()<CR>"
      .. ":lua require'dap.repl'.close()<CR>"
      .. ":lua require'dapui'.close()<CR>"
      .. ":lua require('dap').clear_breakpoints()<CR>"
      .. "<C-w>o<CR>",
    opt
  )
  -- 继续
  map("n", "<leader>dc", ":lua require'dap'.continue()<CR>", opt)
  -- 设置断点
  map("n", "<leader>dt", ":lua require('dap').toggle_breakpoint()<CR>", opt)
  map("n", "<leader>dT", ":lua require('dap').clear_breakpoints()<CR>", opt)
  --  stepOver, stepOut, stepInto
  map("n", "<leader>dj", ":lua require'dap'.step_over()<CR>", opt)
  map("n", "<leader>dk", ":lua require'dap'.step_out()<CR>", opt)
  map("n", "<leader>dl", ":lua require'dap'.step_into()<CR>", opt)
  -- 弹窗
  map("n", "<leader>dh", ":lua require'dapui'.eval()<CR>", opt)
end

-- nvim-cmp 自动补全
pluginKeys.cmp = function(cmp)
  local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
  end
  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end

  return {
    -- 上一个
    -- ["<C-k>"] = cmp.mapping.select_prev_item(),
    -- 下一个
    -- ["<C-j>"] = cmp.mapping.select_next_item(),
    -- 出现补全
    ["<A-.>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    -- 取消
    ["<A-,>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    -- 确认
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ["<CR>"] = cmp.mapping.confirm({
      select = true,
      behavior = cmp.ConfirmBehavior.Replace,
    }),
    -- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    -- 如果窗口内容太多，可以滚动
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),

    -- super Tab
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      elseif has_words_before() then
        cmp.complete()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" }),
    -- end of super Tab
  }
end

-- gitsigns
pluginKeys.gitsigns_on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    map('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    -- Actions
    map({'n', 'v'}, 'hs', ':Gitsigns stage_hunk<CR>')
    map({'n', 'v'}, 'hr', ':Gitsigns reset_hunk<CR>')
    map('n', 'hS', gs.stage_buffer)
    map('n', 'hu', gs.undo_stage_hunk)
    map('n', 'hR', gs.reset_buffer)
    map('n', 'hp', gs.preview_hunk)
    map('n', 'hb', function() gs.blame_line{full=true} end)
    map('n', 'hd', gs.diffthis)
    map('n', 'hD', function() gs.diffthis('~') end)

    -- Text object
    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
end

return pluginKeys
