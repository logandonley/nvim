return {
  "projekt0n/github-nvim-theme",
  config = function()
    vim.opt.background = "dark"
    vim.cmd.colorscheme "github_dark_colorblind"
  end,
  priority = 1000,
  lazy = false
}
