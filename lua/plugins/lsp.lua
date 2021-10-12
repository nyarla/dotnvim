local exec = require("utils.exec")
local installer = require("nvim-lsp-installer")

installer.on_server_ready(
  function(server)
    exec("do User LspAttachBuffers")
  end
)

local kind = require("lspkind")
kind.init {}

local cmp = require("cmp")
cmp.setup {
  mapping = {
    ["<Tab>"] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Insert}),
    ["<S-Tab>"] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Insert}),
    ["<CR>"] = cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Replace, select = true}),
    ["<Left>"] = cmp.mapping.close()
  },
  sources = {
    {name = "nvim_lsp"},
    {name = "path"},
    {name = "treesitter"},
    {name = "cmp_tabnine"},
    {name = "buffer"},
    {name = "vsnip"}
  },
  formatting = {
    format = kind.cmp_format({width_text = true, maxwidth = 50})
  },
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end
  }
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require "cmp_nvim_lsp".update_capabilities(capabilities)

local config = require "lspconfig"
local servers = {
  "bashls",
  "cmake",
  "cssls",
  "denols",
  "dockerls",
  "gopls",
  "html",
  "jsonls",
  "rnix",
  "tsserver",
  "vimls",
  "yamlls"
}

for _, lsp in ipairs(servers) do
  config[lsp].setup {
    capabilities = capabilities
  }
end
