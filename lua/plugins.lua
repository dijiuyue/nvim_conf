---@diagnostic disable: undefined-global
--在没有安装packer的电脑上，自动安装packer插件
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})	--默认地址
	--fn.system({'git', 'clone', '--depth', '1', 'https://codechina.csdn.net/mirrors/wbthomason/packer.nvim.git', install_path})	--csdn加速镜像
	vim.cmd 'packadd packer.nvim'
end
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]
return require('packer').startup({
	function()
		use 'wbthomason/packer.nvim'-- Packer can manage itself
		use {
			"vim-airline/vim-airline",
			requires = {
				"vim-airline/vim-airline-themes",
				--综合图标支持such vim-airline lightline, vim-startify
				"ryanoasis/vim-devicons"
			}
		}
		--内嵌浮动ranger插件
		use "kevinhwang91/rnvimr"
		-- 文件管理插件，类似与ranger。小孩子才做选择，我都要
		use {
			"Shougo/defx.nvim",
			requires = {
				"kristijanhusak/defx-icons", -- dexf文件管理图标支持
				"t9md/vim-choosewin" -- 窗口选择器,可以让defx使用i打开文件
			}
		}
		--主题
		use "sainnhe/gruvbox-material"
		use {
			'nvim-telescope/telescope.nvim', tag = '0.1.0',
			-- or                            , branch = '0.1.x',
			requires = { {'nvim-lua/plenary.nvim'} }
		}
		use {
			'nvim-treesitter/nvim-treesitter',
			run = function()
				local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
				ts_update()
			end,}
			use("nvim-treesitter/nvim-treesitter-context")
			use("mbbill/undotree")
			use {
				'VonHeikemen/lsp-zero.nvim',
				branch = 'v1.x',
				requires = {
					-- LSP Support
					{'neovim/nvim-lspconfig'},
					{'williamboman/mason.nvim'},
					{'williamboman/mason-lspconfig.nvim'},

					-- Autocompletion
					{'hrsh7th/nvim-cmp'},
					{'hrsh7th/cmp-buffer'},
					{'hrsh7th/cmp-path'},
					{'saadparwaiz1/cmp_luasnip'},
					{'hrsh7th/cmp-nvim-lsp'},
					{'hrsh7th/cmp-nvim-lua'},

					-- Snippets
					{'L3MON4D3/LuaSnip'},
					{'rafamadriz/friendly-snippets'},
				}
			}
			use {
				'nvim-tree/nvim-tree.lua',
				requires = {
					'nvim-tree/nvim-web-devicons', -- optional
				},
				config = function()
					require("nvim-tree").setup {}
				end
			}
			use {
  "folke/which-key.nvim",
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    require("which-key").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
}




		end,
		config = {
			max_jobs = 16,
			git = {
				--default_url_format = 'https://hub.fastgit.org/%s'
				--csdn速度稳定，但是很多冷门的项目没有
				--default_url_format = 'https://codechina.csdn.net/mirrors/%s'
			},
			display = {
				open_fn = function()
					return require('packer.util').float({ border = 'single' })
				end
			}
		}
	})

